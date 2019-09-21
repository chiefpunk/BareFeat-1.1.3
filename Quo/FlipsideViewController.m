

#import "FlipsideViewController.h"
#import "EnterNameController.h"
#import "BannerViewController.h"
#import <SafariServices/SafariServices.h>

@interface FlipsideViewController () <SFSafariViewControllerDelegate>

@end

@implementation     FlipsideViewController {
    BannerViewController *_bannerViewController;
}

@synthesize     PlayGameDone, HowToPlay, saveScoreButton, backSoundButton, flipSoundButton, levelSoundButton;
@synthesize     resetGameButton;
@synthesize     startGameButton;
@synthesize     GameCenterButton;
@synthesize     slavamaxButton;
@synthesize     databaseNumber, Record;
@synthesize     sound1Switch, sound2Switch, mycopyButton, soundFinishLevelSwitch;
@synthesize     segmentContent, segmentLanguage;
@synthesize     labelPuls;
@synthesize     _puls, slider;
@synthesize     currentScore, currentLevel, CurrentGrade, currentRecord;
@synthesize     chengedLevelOrGrade, ivEnterNameController;




#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    // [self dismissViewControllerAnimated:true completion:nil]; // закрывает два
    [controller dismissViewControllerAnimated:true completion:nil];
}


 

- (IBAction)slavamaxPressed:(UIButton *)sender {
  NSURL *url = [NSURL URLWithString:@"https://www.slavamax.com/index.html"];
     //   NSURL *url = [NSURL URLWithString:@"https://www.slavamax.com"];
    SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:url];
    svc.delegate = self;
    [self presentViewController:svc animated:YES completion:nil];
}

//**********************
- (IBAction) GameCenterPressed:(id)sender {
    //////NSLog(@"%@", @"GameCenterPressed");
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //////NSLog(@"%@", @"iPhone GameCenterPressed");
        GameCenterController *controller = [[[GameCenterController alloc] initWithNibName:@"GameCenterView" bundle:nil] autorelease];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        _bannerViewController = [[BannerViewController alloc] initWithContentViewController:controller];
        [self presentViewController:_bannerViewController animated:YES completion:nil];
        
    } else {
        //////NSLog(@"%@", @"iPad GameCenterPressed");
        GameCenterController *controller = [[[GameCenterController alloc] initWithNibName:@"GameCenterView_iPad" bundle:nil] autorelease];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        _bannerViewController = [[BannerViewController alloc] initWithContentViewController:controller];
        [self presentViewController:_bannerViewController animated:YES completion:nil];
        
    }
}
//**********************//**********************
- (IBAction) recoredPressed:(id)sender {
    //////NSLog(@"%@", @"recoredPressed");
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"ScrollPosotion"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
	
	
   
    
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
           //////NSLog(@"%@", @"iPhone recoredPressed");
        ScoresTableViewController *controller = [[[ScoresTableViewController alloc] initWithNibName:@"ScoresTableViewController" bundle:nil] autorelease];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        // [self presentViewController:controller animated:YES completion:nil];
        _bannerViewController = [[BannerViewController alloc] initWithContentViewController:controller];
        [self presentViewController:_bannerViewController animated:YES completion:nil];
        
        

    
    } else {
          //////NSLog(@"%@", @"iPad recoredPressed");
        ScoresTableViewController *controller = [[[ScoresTableViewController alloc] initWithNibName:@"ScoresTableViewController_iPad" bundle:nil] autorelease];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        // [self presentViewController:controller animated:YES completion:nil];
        _bannerViewController = [[BannerViewController alloc] initWithContentViewController:controller];
        [self presentViewController:_bannerViewController animated:YES completion:nil];
        
        

    }
    

    
}

- (IBAction) saveScorePressed:(id)sender {
   //////NSLog(@"%@", @"saveScorePressed");

 	
	
	
    EnterNameController *controller = [[[EnterNameController alloc] initWithNibName:@"EnterName" bundle:nil] autorelease];
	 
    
    
    
   controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
      [self presentViewController:controller animated:YES completion:nil];

}



- (IBAction) restartGame:(id)sender{
    //////////NSLog(@"%@", @"restartGame");
    
    
    //  askToRestart = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"WARNING", nil)  message:NSLocalizedString(@"Do you really want to start this game again?", nil)  delegate:self cancelButtonTitle:NSLocalizedString(@"Restart", nil)    otherButtonTitles:NSLocalizedString(@"Cancel", nil) , nil];
    //askToRestart.delegate = self;
    //   [askToRestart show];
    
    UIAlertController *alert = [UIAlertController  alertControllerWithTitle:NSLocalizedString(@"WARNING", nil) message:NSLocalizedString(@"Do you really want to start this game again?", nil) preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Restart", nil)   style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // do your action on ok click
        int currentGrade1=1;
        [[NSUserDefaults standardUserDefaults] setInteger:currentGrade1 forKey:@"CurrentGrade"];
        
        int currentScore1 = 100;
        [[NSUserDefaults standardUserDefaults] setInteger:currentScore1 forKey:@"CurrentScore"];
        
        int currentLevel1 = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:currentLevel1 forKey:@"CurrentLevel"];
        
        
        [self setScore];
        [self setGrade];
        [self setLevelName];
        chengedLevelOrGrade = TRUE;
        
        [[NSUserDefaults standardUserDefaults] setBool:chengedLevelOrGrade forKey:@"chengedLevelOrGrade"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // do your action on cancel click
        
    }]];
    
    UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    
    if ( viewController.presentedViewController && !viewController.presentedViewController.isBeingDismissed ) {
        
        viewController = viewController.presentedViewController;
        
    }
    
    [viewController presentViewController:alert animated:YES completion:^{
        
    }];
    
    
}
//**********************

- (IBAction) resetGame:(id)sender {
    //////////NSLog(@"%@", @"resetGame");
    
    //  askToReset = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"WARNING", nil)  message:NSLocalizedString(@"Do you really want to reset this game? This will delete all scores and reset settings to default. This action cannot be undone.", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Reset", nil) otherButtonTitles:NSLocalizedString(@"Cancel", nil) , nil];
    // askToReset.delegate=self;
    //  [askToReset show];
    
    
    
    UIAlertController *alert = [UIAlertController  alertControllerWithTitle:NSLocalizedString(@"WARNING", nil)   message:NSLocalizedString(@"Do you really want to reset this game? This will delete all scores and reset settings to default. This action cannot be undone.", nil) preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Reset", nil)style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // do your action on ok click
        
        int currentGrade1=1;
        [[NSUserDefaults standardUserDefaults] setInteger:currentGrade1 forKey:@"CurrentGrade"];
        
        int currentScore1 = 100;
        [[NSUserDefaults standardUserDefaults] setInteger:currentScore1 forKey:@"CurrentScore"];
        
        int currentLevel1 = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:currentLevel1 forKey:@"CurrentLevel"];
        
        soundFinishLevelSwitch.on = YES;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"soundFinishLevelSwitch"];
        
        segmentContent.selectedSegmentIndex = 0;
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"currentFlip"];
        
        
        
        if (sound1Switch.on) {
            
        } else {
            sound1Switch.on = YES;
            AppDelegate *appDelegate=  (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [appDelegate pause:nil];
            
        }
        
        sound1Switch.on = YES;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"sound1Switch"];
        
        sound2Switch.on = YES;
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"sound2Switch"];
        
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self setScore];
        [self setGrade];
        [self setLevelName];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        //////////NSLog(@"path %@",@"342");
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"Data.plist"];
        
        BOOL success;
        NSError *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        
        
        
        
        
        
        
        NSString *defaultDBPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
        
        if ([ fileManager fileExistsAtPath:writableDBPath])
        {
            //removing destination, so soucer may be copied
            if (![fileManager removeItemAtPath:writableDBPath error:&error])
            {
                //////////NSLog(@"Could not remove old files. Error:%@", error);
                
            }
        }
        
        success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if (!success) {
            NSAssert1(0, @"Failed to create writable Data.plist file with message '%@'.", [error localizedDescription]);
        } else {
            //////////NSLog(@"    copied to Documents folder.");
            
        }
        Record  =  100;
        
        NSString *s=[NSString stringWithFormat:@"%@%i", NSLocalizedString(@"Record: ", nil), Record];
        //////////NSLog(@"*s = %@", s);
        
        // [currentRecord setAttributedTitle:nil forState:UIControlStateNormal];
        [currentRecord setTitle:s forState:UIControlStateNormal];
        
        chengedLevelOrGrade = TRUE;
        
        
        //////////NSLog(@"reset chengedLevelOrGrade= %@", chengedLevelOrGrade ? @"Yes" : @"No");
        
        [[NSUserDefaults standardUserDefaults] setBool:chengedLevelOrGrade forKey:@"chengedLevelOrGrade"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        // do your action on cancel click
    }]];
    
    UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    
    if ( viewController.presentedViewController && !viewController.presentedViewController.isBeingDismissed ) {
        
        viewController = viewController.presentedViewController;
        
    }
    [viewController presentViewController:alert animated:YES completion:^{
        
    }];
    
    
}
//*********END resetGame *************


//**********************
- (IBAction) soundFinishLevelPressed:(id)sender {
    //////NSLog(@"%@", @"soundFinishLevelPressed");
    
    
    if (soundFinishLevelSwitch.on) {
        soundFinishLevelSwitch.on = NO;
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"soundFinishLevelSwitch"];
    } else {
        soundFinishLevelSwitch.on = YES;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"soundFinishLevelSwitch"];
        
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
}
- (IBAction) soundFinishLevelChanged:(id)sender {
    //////NSLog(@"%@", @"soundFinishLevelChanged");
    
    
    
    
    if (soundFinishLevelSwitch.on) {
        
        
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"soundFinishLevelSwitch"];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"soundFinishLevelSwitch"];
        
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
//*********END resetGame *************

- (IBAction) levelNamePressed:(id)sender {

int CurrentLevel =  (int) [[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentLevel"];
    //////NSLog(@"CurrentLevel = %i", CurrentLevel);
    CurrentLevel ++;
    if (CurrentLevel>24) CurrentLevel=1;
    //////NSLog(@"CurrentLevel ++ = %i", CurrentLevel);
    [[NSUserDefaults standardUserDefaults] setInteger:CurrentLevel forKey:@"CurrentLevel"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self setLevelName];
      chengedLevelOrGrade = TRUE;
    

    //////NSLog(@"Flip levelName chengedLevelOrGrade= %@", chengedLevelOrGrade ? @"Yes" : @"No");
    
    [[NSUserDefaults standardUserDefaults] setBool:chengedLevelOrGrade forKey:@"chengedLevelOrGrade"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



- (IBAction) gradeNamePressed:(id)sender {
    int currentGrade =  (int) [[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentGrade"];
    //////NSLog(@"CurrentGrade = %i", currentGrade);
    currentGrade ++;
    if (currentGrade>14) currentGrade=1;
    //////NSLog(@"CurrentGrade ++ = %i", currentGrade);
    [[NSUserDefaults standardUserDefaults] setInteger:currentGrade forKey:@"CurrentGrade"];
    [[NSUserDefaults standardUserDefaults] synchronize];
 [self setGrade];
    chengedLevelOrGrade = TRUE;
    
    //////NSLog(@"Flip gradename chengedLevelOrGrade= %@", chengedLevelOrGrade ? @"Yes" : @"No");
    
    [[NSUserDefaults standardUserDefaults] setBool:chengedLevelOrGrade forKey:@"chengedLevelOrGrade"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (void) setGrade {
    int currentGrade =  (int) [[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentGrade"];
    if (currentGrade>14) {
        currentGrade=1;
        chengedLevelOrGrade = TRUE;
        
        [[NSUserDefaults standardUserDefaults] setBool:chengedLevelOrGrade forKey:@"chengedLevelOrGrade"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        }
    //////NSLog(@"currentGrade = %i", currentGrade);
 
    
    //  currentScore.titleLabel.text = [greekNames objectAtIndex: CurrentLevel-1];
    NSString *s=[NSString stringWithFormat:@"%@%d", @"Grade: ", currentGrade];
    //////NSLog(@"*s = %@", s);
    
 //   [CurrentGrade setAttributedTitle:nil forState:UIControlStateNormal];
    
    [CurrentGrade setTitle:s forState:UIControlStateNormal];
}


- (void) setLevelName {
    int CurrentLevel =   (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentLevel"];
     if (CurrentLevel>24) {
         CurrentLevel=1;
         chengedLevelOrGrade = TRUE;
         
         [[NSUserDefaults standardUserDefaults] setBool:chengedLevelOrGrade forKey:@"chengedLevelOrGrade"];
         [[NSUserDefaults standardUserDefaults] synchronize];
        }
    
     //////NSLog(@"CurrentLevel = %i", CurrentLevel);
    NSArray *greekNames = [NSArray arrayWithObjects: @"Alpha (α)", @"Beta (β)", @"Gamma (γ)", @"Delta (δ)",  @"Epsilon (ε)",  @"Zeta (ζ)",  @"Eta (η)", @"Theta (θ)",  @"Iota (ι)",  @"Kappa (κ)",  @"Lambda (λ)",  @"Mu (μ)",  @"Nu (ν)",  @"Xi (ξ)",  @"Omicron (ο)",  @"Pi (π)",  @"Rho (ρ)",
                             @"Sigma (ς)",  @"Tau (τ)",  @"Upsilon (υ)",  @"Phi (φ)",  @"Chi (χ)",  @"Psi (ψ)",  @"Omega (ω)", nil];
    
  //  currentScore.titleLabel.text = [greekNames objectAtIndex: CurrentLevel-1];
    NSString *s=[NSString stringWithFormat:@"%@%@", @"Level: ", [greekNames objectAtIndex: CurrentLevel-1]];
    //////NSLog(@"*s = %@", s);

  //  [currentLevel setAttributedTitle:nil forState:UIControlStateNormal];
    
    [currentLevel setTitle:s forState:UIControlStateNormal];
}

//*** Tap Any Triangle to move


- (void) StartTheGameAgain {
 
 //////NSLog(@"%@", @"StartTheGameAgain");
    
}

- (void) setScore {
int CurrentScore99 =  (int) [[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentScore"];

//////NSLog(@"CurrentScore = %i", CurrentScore99);
    
    NSString *s=[NSString stringWithFormat:@"%@%i", @"Score: ", CurrentScore99];
    //////NSLog(@"*s = %@", s);

    //[currentScore setAttributedTitle:nil forState:UIControlStateNormal];
    
    [currentScore setTitle:s forState:UIControlStateNormal];

}

- (void)viewDidDisappear:(BOOL)animated
{
     //////NSLog(@"Flip viewDidDisappear");
}

- (IBAction) moreApp: (id) sender
{
    
   }



-(IBAction) setOwnPhrase:(id)sender {
    //////NSLog(@"**** HELP FlipsideViewController setOwnPhrase Pressed");
    // [segmentContent setSelectedSegmentIndex:UISegmentedControlNoSegment];
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //FlipsideViewController *controller = [[[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil] autorelease];
        
       
            //ранние iPhone
        OwnPhraseViewController *controller = [[[OwnPhraseViewController alloc] initWithNibName:@"OwnPhraseViewController" bundle:nil] autorelease];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        _bannerViewController = [[BannerViewController alloc] initWithContentViewController:controller];
        [self presentViewController:_bannerViewController animated:YES completion:nil];
        
            
       
    } else {
        // iPad
        
       
        OwnPhraseViewController *controller = [[[OwnPhraseViewController alloc] initWithNibName:@"OwnPhraseViewController_iPad" bundle:nil] autorelease];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        _bannerViewController = [[BannerViewController alloc] initWithContentViewController:controller];
        [self presentViewController:_bannerViewController animated:YES completion:nil];
        
        
    }
    
    
    
    
}


- (void)viewDidAppear:(BOOL)animated

{
    
    //////NSLog(@"%@", @"FlipsideViewController viewDidAppear");
    
     [self setLevelName];
     [self setGrade];
     [self setScore];

    //   _puls=[[NSUserDefaults standardUserDefaults] integerForKey:@"Puls"];
       // //////NSLog(@"1 viewDidAppear _puls=%d", _puls);
    
    NSNumber *num = [NSNumber numberWithInt:_puls];
    if(num == nil)  // compare against nil
        _puls=7;  // do one thing
    else if([num intValue] == 0)  // compare against 0
        _puls=7;  // do another thing
    
       labelPuls.text= [NSString stringWithFormat:@"%is", _puls];

    [slider setValue:(float)_puls];
        ////////NSLog(@"FlipsideViewController 2 viewDidAppear _puls=%d", _puls);
     
    ////////NSLog(@"*--* FlipsideViewController viewDidAppear databaseNumber=%i", databaseNumber);
    

}

-(IBAction) pulsPressed: (id) sender {
	_puls++;
    if (_puls>9999) {
        _puls=9999;
    }
    
    labelPuls.text= [NSString stringWithFormat:@"%ds", _puls];
    [slider setValue:(float)_puls];
    
    [[NSUserDefaults standardUserDefaults] setInteger:_puls forKey:@"Puls"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //[[NSUserDefaults standardUserDefaults] setInteger:_puls forKey:@"Puls"];
    //[[NSUserDefaults standardUserDefaults] synchronize];
    // [[NSUserDefaults standardUserDefaults] integerForKey:@"Puls"];
    ////////NSLog(@"_puls=%d", _puls);
    
}


-(IBAction)changeSegmentContent{
     //////NSLog(@"%@", @"--- changeSegmentContent");
    
    if(segmentContent.selectedSegmentIndex == 0){
         //////NSLog(@"%@", @"--- changeSegmentContent 0");
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"currentFlip"];
        sound2Switch.on = YES;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"sound2Switch"];
        
	}
	if(segmentContent.selectedSegmentIndex == 1){
         //////NSLog(@"%@", @"--- changeSegmentContent 1");
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"currentFlip"];
        
        sound2Switch.on = YES;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"sound2Switch"];
	}
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
	
}

-(IBAction)changeSegmentLanguage{
         //////NSLog(@"%@", @"--- changeSegmentLanguage");
    
	    
}



- (IBAction) switch1Changed: (id) sender {
    AppDelegate *appDelegate=  (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate pause:nil];
    
    if (sound1Switch.on) {
        
        
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"sound1Switch"];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"sound1Switch"];
        
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction) switch2Changed: (id) sender {
    
    if (sound2Switch.on) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"sound2Switch"];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"sound2Switch"];
        
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (IBAction) switch1Pressed: (id) sender
{
    AppDelegate *appDelegate=  (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate pause:nil];

    if (sound1Switch.on) {
        sound1Switch.on = NO;
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"sound1Switch"];
    } else {
        sound1Switch.on = YES;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"sound1Switch"];
        
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (IBAction) switch2Pressed: (id) sender
{
    if (sound2Switch.on) {
        sound2Switch.on = NO;
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"sound2Switch"];
    } else {
        sound2Switch.on = YES;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"sound2Switch"];
        
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}





- (void)viewWillAppear:(BOOL)animated {
    
    //////NSLog(@"%@", @"*** FLIP VIEW viewWillAppear");
    chengedLevelOrGrade = FALSE;
    
    //self.segmentContent.tintColor = [UIColor whiteColor];
    
    BOOL sound1SwitchTrigger =  [[NSUserDefaults standardUserDefaults] boolForKey:@"sound1Switch"];
    if (!sound1SwitchTrigger )
	{
        sound1Switch.on = NO;
        
    } else   sound1Switch.on =  YES;
    
    sound1SwitchTrigger =  [[NSUserDefaults standardUserDefaults] boolForKey:@"sound2Switch"];
    if (!sound1SwitchTrigger)
	{
        sound2Switch.on = NO;
        
    } else   sound2Switch.on =  YES;
    
    sound1SwitchTrigger =  [[NSUserDefaults standardUserDefaults] boolForKey:@"soundFinishLevelSwitch"];
    if (!sound1SwitchTrigger)
	{
        soundFinishLevelSwitch.on = NO;
        
    } else   soundFinishLevelSwitch.on =  YES;
    
    
    
    segmentContent.selectedSegmentIndex =0;
    int i =  (int) [[NSUserDefaults standardUserDefaults] integerForKey:@"currentFlip"];
    
    if (i == 1 )
	{
        
        segmentContent.selectedSegmentIndex =1;
    }
    
    
    
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //////NSLog(@"path %@",@"805");
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Data.plist"];
    //////NSLog(@"path %@",path);
    
    NSArray *arrayOfScores = [[NSMutableArray alloc] initWithContentsOfFile:path];
    //////NSLog(@"path %@",@"811");
    if (arrayOfScores == nil || [arrayOfScores count] == 0) {
        
        
        Record = 100;
        
        NSString *s=[NSString stringWithFormat:@"%@%i",  NSLocalizedString(@"Record: ", nil), Record];
        //////NSLog(@"*s = %@", s);
        
        // [currentRecord setAttributedTitle:nil forState:UIControlStateNormal];
        
        [currentRecord setTitle:s forState:UIControlStateNormal];
        
    } else	{
        
        NSDictionary *firstDictionary = [arrayOfScores objectAtIndex:0];
        Record =  [[firstDictionary objectForKey:@"scoresForName"] intValue];
        
        NSString *s=[NSString stringWithFormat:@"%@%i",  NSLocalizedString(@"Record: ", nil), Record];
        //////NSLog(@"*s = %@", s);
        
        // [currentRecord setAttributedTitle:nil forState:UIControlStateNormal];
        
        [currentRecord setTitle:s forState:UIControlStateNormal];
    }
    
    
}

- (void)dealloc
{
    
    [slider release];
    slider = nil;
    [labelPuls release];
    labelPuls = nil;
    
 
    
    [resetGameButton release];
    resetGameButton = nil;
    
    [startGameButton release];
    startGameButton = nil;
    
    [GameCenterButton release];
    GameCenterButton = nil;
    
    [slavamaxButton release];
    slavamaxButton = nil;
    
    
    [flipSoundButton release];
    flipSoundButton = nil;
    
    [saveScoreButton release];
    saveScoreButton = nil;
    [PlayGameDone release];
    PlayGameDone = nil;
    [HowToPlay release];
    HowToPlay = nil;
    
    
    [backSoundButton release];
    backSoundButton = nil;
    
    
    [mycopyButton release];
    mycopyButton = nil;
    [sound1Switch release];
    sound1Switch = nil;
    
    [soundFinishLevelSwitch release];
    soundFinishLevelSwitch = nil;

    [currentRecord release];
    currentRecord = nil;
    
    [ivEnterNameController release];
	
    [sound2Switch release];
    sound2Switch = nil;
    [currentScore release];
    currentScore = nil;
     [CurrentGrade release];
    CurrentGrade = nil;
    [currentLevel release];
    currentLevel = nil;
    [slavamaxButton release];
    [super dealloc];
}

- (BOOL)shouldAutorotate {
     ////////NSLog(@"%@", @"shouldAutorotate");
    return NO;
}

 
/*
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
 
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
         //////NSLog(@"%@", @"UIInterfaceOrientationPortrait Phone - currentDevice");
         return UIInterfaceOrientationPortrait;
    } else {
                //////NSLog(@"%@", @"UIInterfaceOrientationMaskAll iPad - currentDevice");
       // return UIInterfaceOrientationMaskAll;
     //  return UIInterfaceOrientationPortrait | UIInterfaceOrientationPortraitUpsideDown | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;

    }
  
}
  */

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
    }
    return self;
}

- (void)buttonIOS6:(UIButton *)mybutton
{
      UIColor *myColorBorder =    [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.0];
    mybutton.layer.borderWidth = 1;
    //  PlayGameDone.layer.borderColor = [UIColor lightGrayColor].CGColor;
    mybutton.layer.borderColor=[myColorBorder CGColor];
    mybutton.layer.cornerRadius = 8;
    mybutton.layer.masksToBounds = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //////NSLog(@"%@", @"viewDidLoad FlipsideViewController");
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
         //////NSLog(@"%@", @"NSFoundationVersionNumber_iOS_6_1 or earlier");
        
        // Load resources for iOS 6.1 or earlier
        
    } else {
        // Load resources for iOS 7 or later
        //////NSLog(@"%@", @" iOS 7 or later");
        
        
   
    [self buttonIOS6:PlayGameDone];
    [self buttonIOS6:HowToPlay];
    [self buttonIOS6:currentLevel];
    [self buttonIOS6:CurrentGrade];
    [self buttonIOS6:currentScore];
    [self buttonIOS6:saveScoreButton];
    [self buttonIOS6:currentRecord];
    [self buttonIOS6:backSoundButton];
    [self buttonIOS6:flipSoundButton];
    [self buttonIOS6:levelSoundButton];
    [self buttonIOS6:resetGameButton];
    [self buttonIOS6:startGameButton];
    [self buttonIOS6:GameCenterButton];
    [self buttonIOS6:slavamaxButton];
  
 
        
    }
    
    

	// Do any additional setup after loading the view, typically from a nib.
    
   // [[UINavigationBar appearance] setTintColor: ];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




// Посылаем почту
-(IBAction)showMailerKeyboard:(id)sender {
////////NSLog (@" showMailerKeyboard ");
    //  [rootController.keyboard.view setHidden:YES];
    
    
	// This sample can run on devices running iPhone OS 2.0 or later
	// The MFMailComposeViewController class is only available in iPhone OS 3.0 or later.
	// So, we must verify the existence of the above class and provide a workaround for devices running
	// earlier versions of the iPhone OS.
	// We display an email composition interface if MFMailComposeViewController exists and the device can send emails.
	// We launch the Mail application on the device, otherwise.
	
	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		if ([mailClass canSendMail])
		{
			[self displayComposerSheetKeyboard];
		}
		else
		{
			[self launchMailAppOnDeviceKeyboard];
		}
	}
	else
	{
		[self launchMailAppOnDeviceKeyboard];
	}
}

-(void)displayComposerSheetKeyboard {
  }

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    //message.hidden = NO;
    // Notifies users about errors associated with the interface
    switch (result)
    {
        case MFMailComposeResultCancelled:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Result:"  message:@"canceled" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                // do your action on cancel click
            }]];
            UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
            if ( viewController.presentedViewController && !viewController.presentedViewController.isBeingDismissed ) {
                viewController = viewController.presentedViewController;
            }
            [viewController presentViewController:alert animated:YES completion:^{ }];
        }
        break;
        case MFMailComposeResultSaved:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Result:"  message:@"saved" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                // do your action on cancel click
            }]];
            UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
            if ( viewController.presentedViewController && !viewController.presentedViewController.isBeingDismissed ) {
                viewController = viewController.presentedViewController;
            }
            [viewController presentViewController:alert animated:YES completion:^{ }];
        }
        break;
        case MFMailComposeResultSent:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Result:"  message:@"sent" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                // do your action on cancel click
            }]];
            UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
            if ( viewController.presentedViewController && !viewController.presentedViewController.isBeingDismissed ) {
                viewController = viewController.presentedViewController;
            }
            [viewController presentViewController:alert animated:YES completion:^{ }];
        }
        break;
        case MFMailComposeResultFailed:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Result:"  message:@"failed" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                // do your action on cancel click
            }]];
            UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
            if ( viewController.presentedViewController && !viewController.presentedViewController.isBeingDismissed ) {
                viewController = viewController.presentedViewController;
            }
            [viewController presentViewController:alert animated:YES completion:^{ }];
        }
        break;
        default:
        
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Result:"  message:@"not sent" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                // do your action on cancel click
            }]];
            UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
            if ( viewController.presentedViewController && !viewController.presentedViewController.isBeingDismissed ) {
                viewController = viewController.presentedViewController;
            }
            [viewController presentViewController:alert animated:YES completion:^{ }];
        }
        break;
    }
    
    //   [rootController.keyboard.view setHidden:NO];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Workaround
// Launches the Mail application on the device.
-(void)launchMailAppOnDeviceKeyboard {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Attention:"  message:@"the current device is NOT configured for sending emails." preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // do your action on cancel click
    }]];
    UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    if ( viewController.presentedViewController && !viewController.presentedViewController.isBeingDismissed ) {
        viewController = viewController.presentedViewController;
    }
    [viewController presentViewController:alert animated:YES completion:^{ }];
    
}


#pragma mark - Flipside View Controller

- (void)OwnPhraseViewControllerDidFinish:(OwnPhraseViewController *)controller
{
    /*
     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
     [self dismissViewControllerAnimated:YES completion:nil];
     } else {
     [self.flipsidePopoverController dismissPopoverAnimated:YES];
     }
     */
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - slider action methods

- (IBAction)sizeSlideAction:(id)sender
{
	
CGFloat val = [slider value];
     _puls = roundl(val); // Rounds float to an integer
   // [slider setValue:(float)_puls]; // Sets your slider to this value
   //labelPuls.text= [NSString stringWithFormat:@"%0.0fs", val];
    

   labelPuls.text= [NSString stringWithFormat:@"%is", _puls];
    [slider setValue:(float)_puls];
    
        ////////NSLog(@"sizeSlideAction _puls=%i", _puls);
}


#pragma mark - Actions

- (IBAction)done:(id)sender
{
    ////////NSLog(@"%@", @"done");
    [[NSUserDefaults standardUserDefaults] setInteger:_puls forKey:@"Puls"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    ////////NSLog(@"FlipsideViewController _puls=%d", _puls);
    
   // MainViewController *parentVC = (MainViewController*)self.parentViewController;
   // [parentVC newLevelStart];

    [self.delegate flipsideViewControllerDidFinish:self];
    
   // ParentViewController *presenter = [(UITabBarController *)self.presentingViewController viewControllers][0]; // 0 is assuming that ParentViewController is in the first tab. Change if necessary
    //[presenter foo];
}

#pragma mark - Flipside View Controller
- (void) GameCenterControllerDidFinish:(GameCenterController *)controller;
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void) EnterNameControllerDidFinish:(EnterNameController *)controller;
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void) EnterNameControllerDidFinish2:(EnterNameController *)controller atIndex:(NSUInteger)indexOfRow;
{
    
   // [self dismissViewControllerAnimated:YES completion:nil];
    
    [[NSUserDefaults standardUserDefaults] setInteger:indexOfRow forKey:@"ScrollPosotion"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
   
    
    
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
         ScoresTableViewController *controller2 = [[[ScoresTableViewController alloc] initWithNibName:@"ScoresTableViewController" bundle:nil] autorelease];
        controller2.delegate = self;
        controller2.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        [self dismissViewControllerAnimated:NO completion:^{
            [self presentViewController:controller2 animated:YES completion:NULL];
        }];
    } else {
        
        
        ScoresTableViewController *controller2 = [[[ScoresTableViewController alloc] initWithNibName:@"ScoresTableViewController_iPad" bundle:nil] autorelease];
        controller2.delegate = self;
        controller2.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        [self dismissViewControllerAnimated:NO completion:^{
            [self presentViewController:controller2 animated:YES completion:NULL];
        }];
    }
    
    
    
    
    

    
   
  //  [self.presentingViewController presentModalViewController:controller2 animated:YES];
    //self.view.hidden = TRUE;

       // self.view.hidden = NO;
    
    //////NSLog (@"EnterNameControllerDidFinish2 indexOfRow=%lu", (unsigned long)indexOfRow);
  
  
    
}
- (void) ScoresTableViewControllerDidFinish:(ScoresTableViewController *)controller;
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
