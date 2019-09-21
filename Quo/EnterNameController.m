

#import "EnterNameController.h"
@interface EnterNameController ()

@end

@implementation EnterNameController

@synthesize textField, currentScoresButton, array, cancelButton, saveButton;

@synthesize personName, scoresForName, CurrentScoreToSave;

#pragma mark -
#pragma mark View lifecycle
 
- (void)viewDidLoad {
	// Set the title to the user-visible name of the field.
	self.title = @"Enter Name";

  
    
    UIColor *myColorBorder =    [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.0];
    cancelButton.layer.borderWidth = 1;
     //   cancelButton.layer.borderColor = [UIColor yellowColor].CGColor;
   cancelButton.layer.borderColor = [myColorBorder CGColor];
    cancelButton.layer.cornerRadius = 8;
    cancelButton.layer.masksToBounds = YES;
    
    saveButton.layer.borderWidth = 1;
    //   cancelButton.layer.borderColor = [UIColor yellowColor].CGColor;
    saveButton.layer.borderColor = [myColorBorder CGColor];
    saveButton.layer.cornerRadius = 8;
    saveButton.layer.masksToBounds = YES;
 
}


- (void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	
	
        textField.hidden = NO;

      //  textField.text = @"benaming van de bladwijzer";
		//textField.placeholder = self.title;
    self.textField.text = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"CurrentUser"];
    //////NSLog(@"textField.text=%@", self.textField.text);  
        [textField becomeFirstResponder];
    CurrentScoreToSave =  (int) [[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentScore"];
    
    //////NSLog(@"CurrentScore = %i", CurrentScoreToSave);
    
  //  NSString *s=[NSString stringWithFormat:@"%@%i", @"Score: ", CurrentScoreToSave];
    //////NSLog(@"*s = %@", s);
  
    
    currentScoresButton.text =  [NSString stringWithFormat:@"Current Score: %d", CurrentScoreToSave];
    

}
#define MAXLENGTH 17

- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
     //////NSLog(@"***textField.text=%@", self.textField.text);
    NSUInteger oldLength = [self.textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
    
    return newLength <= MAXLENGTH || returnKey;
}





- (IBAction)save:(id)sender {
    ////////NSLog(@"%@", @"Save Pressed 2");
    ////////NSLog(@"%@",  textField.text);
    if ([textField.text isEqualToString: @""])  {
        ////////NSLog(@"%@",  @"Save Pressed 3");
        // ||
        
        //_______________________
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:NSLocalizedString(@"Enter your name, please!", nil)
                                      message:@""
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
            //do something when click button
            return;
        }];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        
        [textField resignFirstResponder];
        
        
        [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:@"CurrentUser"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        ////////////NSLog(@"%@", @"Save Pressed 114");
        NSString *documentsDirectory = [paths objectAtIndex:0];
        ////////////NSLog(@"%@", @"Save Pressed 115");
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Data.plist"];
        ////////////NSLog(@"path %@",path);
        ////////////NSLog(@"%@", @"119");
        self.array = [[NSMutableArray alloc] initWithContentsOfFile:path];
        // CurrentScoreToSave
        ////////////NSLog(@"%@", @"122");
        
        int i = 0;
        
        if ([array count]>0) {
            ////////////NSLog(@"%@", @"127");
            
            do
            {
                ////////////NSLog(@"Старт do   i=%d", i);
                NSDictionary *firstDictionary = [array objectAtIndex:i];
                self.scoresForName =  [[firstDictionary objectForKey:@"scoresForName"] intValue];
                ////////////NSLog(@"scoresForName= %d CurrentScoreToSave = %d",scoresForName, CurrentScoreToSave);
                i++;
                //////////NSLog(@"i= %d  array count = %lu",i, (unsigned long)[self.array count]);
            } while ((self.scoresForName  > CurrentScoreToSave)&&(i<[array count]));
            
            //////////NSLog(@"Выход из while");
        }
        
        //////////NSLog(@"%@", @"142");
        NSNumber *sss = [NSNumber numberWithInt:CurrentScoreToSave];
        NSMutableDictionary *item = [NSMutableDictionary dictionaryWithObjectsAndKeys: textField.text, @"Name", sss,  @"scoresForName", nil];
        
        //////////NSLog(@"146 *** i= %d  array count = %lu",i, (unsigned long)[array count]);
        //////////NSLog(@"scoresForName= %d CurrentScoreToSave = %d",scoresForName, CurrentScoreToSave);
        
        if([array count]>100) {
            [self.array removeObjectAtIndex:i-1];
        }
        
        if ((i==[array count])&&(self.scoresForName > CurrentScoreToSave))   {
            //////////NSLog(@"%@", @"154");
            [self.array addObject:item ];
            i++;
        }
        else
        {
            //////////NSLog(@"%@", @"160");
            if (i==0) {
                i=1;
            }
            //////////NSLog(@"%@", @"164");
            [self.array insertObject:item atIndex:i-1];
        }
        
        
        
        if (i < 1) {
            [[NSUserDefaults standardUserDefaults] setInteger:CurrentScoreToSave forKey:@"Record"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
        //////////NSLog(@"%@", @"171");
        paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentsDirectory = [paths objectAtIndex:0];
        
        //////////NSLog(@"%@", @"175");
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Data.plist"];
        
        [self.array writeToFile:filePath atomically:YES];
        //sss = [NSNumber numberWithInt:i-1];
        // int number = [sss intValue];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"JustSavedScore"];
        [[NSUserDefaults standardUserDefaults] setInteger:i-1 forKey:@"ScrollPosotion"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.delegate EnterNameControllerDidFinish:self];
        
        
        // [self.delegate EnterNameControllerDidFinish2:self  atIndex:i-1];
    }
    
}



- (IBAction)cancel:(id)sender {
 [self.delegate EnterNameControllerDidFinish:self];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [array release];
  
    [cancelButton release];
    cancelButton=nil;
    
    [saveButton release];
    saveButton=nil;
    
    [currentScoresButton release];
    
    currentScoresButton=nil;
    [textField release];
    [personName release];
         	[super dealloc];
}


@end

