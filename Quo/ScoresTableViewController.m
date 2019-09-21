
#import "ScoresTableViewController.h"
#import "TableCellView.h"


@interface ScoresTableViewController()
@end





@implementation ScoresTableViewController



#pragma mark -
#pragma mark UIViewController overrides

@synthesize array, myRecltableView, ScrollPosotion, editButton, doneButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //[myRecltableView setDelegate:self];
    }
    return self;
}

-(void)viewWillDisappear:(BOOL)animated {
    
   // [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"WasInWebview"];
   // [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"WasBookmarks"];
   // [[NSUserDefaults standardUserDefaults] synchronize];
    // // // // // ////////NSLog(@"Вышли из DetailViewController");
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //////NSLog(@" %@ ",@"Start viewDidLoad");
    
    
    
    UIColor *myColorBorder =    [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.0];
    doneButton.layer.borderWidth = 1;
    //   cancelButton.layer.borderColor = [UIColor yellowColor].CGColor;
    doneButton.layer.borderColor = [myColorBorder CGColor];
    doneButton.layer.cornerRadius = 8;
    doneButton.layer.masksToBounds = YES;
    
    editButton.layer.borderWidth = 1;
    //   cancelButton.layer.borderColor = [UIColor yellowColor].CGColor;
    editButton.layer.borderColor = [myColorBorder CGColor];
    editButton.layer.cornerRadius = 8;
    editButton.layer.masksToBounds = YES;
    
    
    
}
-(void)viewDidAppear:(BOOL)animated{
  //////NSLog(@" %@ ",@"Start viewDidAppear");
   //////NSLog(@" %@: %d",@"self.ScrollPosotion", self.ScrollPosotion);  
    
    if ( self.ScrollPosotion > 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.ScrollPosotion inSection:0];
        [self.myRecltableView scrollToRowAtIndexPath:indexPath
                                    atScrollPosition:UITableViewScrollPositionTop
                                            animated:YES];
    }
 
 //////NSLog(@" %@ ",@"Finish viewDidAppear");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //////NSLog(@" %@ ",@"Start viewWillAppear");
   // NSString *path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    
    
    
    //NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Data.plist"];
    
    self.ScrollPosotion =  (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"ScrollPosotion"];
    

    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Data.plist"];
    //////NSLog(@"path %@",path);
    
    self.array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    /*
    NSData *plistData = [NSData dataWithContentsOfFile:path];
    NSString *error;
    NSPropertyListFormat format;
    id plist;
    plist = [NSPropertyListSerialization propertyListFromData:plistData
                                             mutabilityOption:NSPropertyListImmutable
                                                       format:&format
                                             errorDescription:&error];
    
    if(!plist){
        //////NSLog(@"%@",error);
        [error release];
    }
    
    */
    
     //////NSLog(@"%@: %lu ",@"Records in Data.plist", (unsigned long)[array count]);
    /*
    for (int i = 0; i < [array count]; i++)
    {
        NSDictionary *firstDictionary = [array objectAtIndex:i];
        NSString *gamerName = [firstDictionary objectForKey:@"Name"];
        int scoresForName =  [[firstDictionary objectForKey:@"scoresForName"] intValue]; ;
        //////NSLog(@"Name: %@ Scores: %d ",gamerName, scoresForName);
        
    }
   */
    
 
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  // //////NSLog(@"cellForRowAtIndexPath");

    /*
     static NSString *CellIdentifier =@"Cell";
     
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell == nil) {
     cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
     }
     
     // Set up the cell...
     cell.text = [arryData objectAtIndex:indexPath.row];
     return cell;*/
    static NSString *MyIdentifier =@"MyIdentifier";
    MyIdentifier =@"tblCellView";
   //   //////NSLog(@"MyIdentifier");
    TableCellView *cell = (TableCellView *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if(cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"TableCellView" owner:self options:nil];
        cell = tblCell;
        
      
    }
    
    NSDictionary *firstDictionary = [self.array objectAtIndex:indexPath.row];
    NSString *gamerName = [firstDictionary objectForKey:@"Name"];
    int scoresForName =  [[firstDictionary objectForKey:@"scoresForName"] intValue]; ;
   // //////NSLog(@"Name: %@ Scores: %d ",gamerName, scoresForName);
    
    
  
     NSString *tempString = [@"  " stringByAppendingString:gamerName];
    [cell setLabelText:tempString];
    
    
    [cell setprice:scoresForName];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row==self.ScrollPosotion) {
         //////NSLog(@"indexPath.row=%ld ScrollPosotion==%d",(long)indexPath.row, self.ScrollPosotion);
        [cell setLabelRedColor];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    
    //////NSLog(@"canEditRowAtIndexPath  Section: %ld, Row: %ld", (long)indexPath.section, (long)indexPath.row);
    return YES;
}

- (IBAction)enterEditMode:(id)sender {
    
    if ([self.myRecltableView isEditing]) {
        //////NSLog(@"self.myRecltableView isEditing");

        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        [self.myRecltableView setEditing:NO animated:YES];
        [self.editButton setTitle:@"Edit"  forState:UIControlStateNormal];
    }
    else {
          //////NSLog(@"self.myRecltableView NO isEditing");
        [self.editButton setTitle:@"Ok"  forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.myRecltableView setEditing:YES animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get the managedObjectContext from the AppDelegate (for use in CoreData Applications)
//AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
  //  NSManagedObjectContext *context = appdelegate.managedObjectContext;
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
       // YourObject *object = [self.dataSourceArray objectAtIndex:indexPath.row];
        //[self.dataSourceArray removeObjectAtIndex:indexPath.row];
        // You might want to delete the object from your Data Store if you’re using CoreData
       // [context deleteObject:pairToDelete];
        //NSError *error;
       // [context save:&error];
        // Animate the deletion
       
         [self.array removeObjectAtIndex:indexPath.row];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Data.plist"];
        
        [self.array writeToFile:filePath atomically:YES];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
        // Additional code to configure the Edit Button, if any
        // if (self.dataSourceArray.count == 0) {
       // self.editButton.enabled = NO;
        [self.editButton setTitle:@"Ok"  forState:UIControlStateNormal];
       // }
   // }
   // else
        /*
        if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        YourObject *newObject = [NSEntityDescription insertNewObjectForEntityForName:@"Header" inManagedObjectContext:context];
        newObject.value = @”value”;
        [context save:&error];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationFade];
        if (self.dataSourceArray.count > 0) {
            self.editButton.enabled = YES;
        }*/
    }
         
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
  //  NSString *link = [linkList objectAtIndex:indexPath.row];
    // //// //////// ////////NSLog(@"link=");
    // //// //////// ////////NSLog(link);
    //NSURL *toOpen=[NSURL URLWithString:link];
    //[[UIApplication sharedApplication] openURL:toOpen];
   // [[UIApplication sharedApplication] openURL: [toOpen autorelease]];
    
    // Finally, if you need different behavior in your app when selecting cells during edit mode, you also need to change the didSelectRowAtIndexPath method, to handle this.
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell isEditing] == YES) {
        // Do something.
    }
    else {
        // Do Something else.
    }
    
}
 
- (void)dealloc {
    [array release];
    [editButton release];
     editButton = nil;
     [doneButton release];
    doneButton = nil;
[myRecltableView release];
    [super dealloc];
}



#pragma mark - Actions

- (IBAction)done:(id)sender
{
        //////NSLog(@"done");
    [self.delegate ScoresTableViewControllerDidFinish:self];
}




@end
