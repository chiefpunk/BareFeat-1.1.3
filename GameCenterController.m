//
//
//
//
//
//
//
//
//
//
//
//
//


#import "GameCenterController.h"

#import "AppSpecificValues.h"
#import "GameCenterManager.h"

#import <QuartzCore/QuartzCore.h>
@interface GameCenterController ()

@end

@implementation GameCenterController
@synthesize cachedHighestScore;
@synthesize gameCenterManager;
@synthesize currentScore, Record;
@synthesize currentLeaderBoard, bestScore;
@synthesize currentScoreButton, recordButton, scoreInGameCenterButton, doneButton, submitScoreButton, submitRecordButton, ShowLeaderboardButton;

@synthesize array, leaderboardHighScoreString;

@synthesize personName, scoresForName, CurrentScoreToSave;

#pragma mark -
#pragma mark View lifecycle



- (void) showAlertWithTitle: (NSString*) title message: (NSString*) message
{
	UIAlertView* alert= [[[UIAlertView alloc] initWithTitle: title message: message
                                                   delegate: NULL cancelButtonTitle: NSLocalizedString(@"OK", nil)   otherButtonTitles: NULL] autorelease];
	[alert show];
	
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}


 

- (void)buttonIOS6:(UIButton *)mybutton
{
    //UIColor *myColorBorder =    [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.0];
    mybutton.layer.borderWidth = 1;
    //  PlayGameDone.layer.borderColor = [UIColor lightGrayColor].CGColor;
    mybutton.layer.borderColor= [[UIColor whiteColor] CGColor];
    mybutton.layer.cornerRadius = 8;
    mybutton.layer.masksToBounds = YES;
}



#ifndef NSFoundationVersionNumber_iOS_6_1
#define NSFoundationVersionNumber_iOS_6_1 993.00
#endif

- (void)viewDidLoad {
    
   // NSLog(@"GameCenterController Start %@", @"viewDidLoad");
    
    
    
   
        
        [self buttonIOS6:currentScoreButton];
        [self buttonIOS6:recordButton];
        [self buttonIOS6:scoreInGameCenterButton];
        [self buttonIOS6:doneButton];
        [self buttonIOS6:submitScoreButton];
        [self buttonIOS6:submitRecordButton];
        [self buttonIOS6:ShowLeaderboardButton];
   
        
        
        
   
    
	  
    self.bestScore = 0;
    
    self.currentLeaderBoard = kLeaderboardID;
    self.currentScore = 0;
    
    
    NSString *s =  [NSString stringWithFormat:NSLocalizedString(@"Score in Game Center: Unavailable", nil) ];
    // [scoreInGameCenterButton setAttributedTitle:nil forState:UIControlStateNormal];
    [scoreInGameCenterButton setTitle:s forState:UIControlStateNormal];
    
    
    if ([GameCenterManager isGameCenterAvailable]) {
          self.gameCenterManager = [[GameCenterManager alloc] init] ;
     //   self.gameCenterManager = [[[GameCenterManager alloc] init] autorelease];
    [self.gameCenterManager setDelegate:self];
       [self.gameCenterManager authenticateLocalUser];
       
        // [self.gameCenterManager reloadHighScoresForCategory: self.currentLeaderBoard];
        
    } else {
        
        // The current device does not support Game Center.
        
        [self showAlertWithTitle: NSLocalizedString(@"The current device does not support Game Center!", nil)
                         message: @""];
    }
    
}

- (IBAction) showLeaderboard
{
    GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
    if (leaderboardController != NULL)
    {
        leaderboardController.category = self.currentLeaderBoard;
        leaderboardController.timeScope = GKLeaderboardTimeScopeWeek;
        leaderboardController.leaderboardDelegate = self;
        [self presentModalViewController: leaderboardController animated: YES];
    } else {
        
        
        
        if([GameCenterManager isGameCenterAvailable])
        {
            self.gameCenterManager= [[GameCenterManager alloc] init];
               // self.gameCenterManager= [[[GameCenterManager alloc] init] autorelease];
            [self.gameCenterManager setDelegate: self];
            [self.gameCenterManager authenticateLocalUser];
            
            
        }
        else
        {
            [self showAlertWithTitle: NSLocalizedString(@"The current device does not support Game Center!", nil) 
                             message: @""];
           
        }

    } // else  if (leaderboardController != NULL)
}

- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    [self dismissModalViewControllerAnimated: YES];
    [viewController release];
}


- (IBAction) submitScore
{
    //NSLog(@"GameCenterController Start %@", @"submitScore");
	
    if(self.CurrentScoreToSave > 0)
    {
        self.bestScore = self.CurrentScoreToSave;
        [self.gameCenterManager reportScore: self.CurrentScoreToSave forCategory: self.currentLeaderBoard];
    }
}


- (IBAction) submitRecord
{
    
    //NSLog(@"GameCenterController Start %@", @"submitRecord");

    if(self.Record > 0)
    {
        
        self.bestScore = self.Record;
        [self.gameCenterManager reportScore: self.Record forCategory: self.currentLeaderBoard];
    }
}

- (IBAction) showAchievements
{
   // GKAchievementViewController *achievements = [[GKAchievementViewController alloc] init];
   // if (achievements != NULL)
   // {
     //   achievements.achievementDelegate = self;
       // [self presentModalViewController: achievements animated: YES];
    //}
}

- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController;
{
    //[self dismissModalViewControllerAnimated: YES];
    //[viewController release];
}

- (void)viewWillAppear:(BOOL)animated {
	 // NSLog(@"GameCenterController Start %@", @"viewWillAppear");
	[super viewWillAppear:animated];
	
	// [self.gameCenterManager reloadHighScoresForCategory: self.currentLeaderBoard];
    
    
    
    CurrentScoreToSave =(int) [[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentScore"];
    
    // NSLog(@"CurrentScore = %i", CurrentScoreToSave);
    
    NSString *s=[NSString stringWithFormat:@"%@%i",  NSLocalizedString(@"Score: ", nil)  , CurrentScoreToSave];
    //NSLog(@"*s = %@", s);
    s =  [NSString stringWithFormat:  NSLocalizedString(@"Current Score: %d", nil)   , CurrentScoreToSave];
   // [currentScoreButton setAttributedTitle:nil forState:UIControlStateNormal];
    [currentScoreButton setTitle:s forState:UIControlStateNormal];
    
    
    
    
//---------------------------------
    
//---------------------------------
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Data.plist"];
    //NSLog(@"path %@",path);
    NSArray *arrayOfScores = [[NSMutableArray alloc] initWithContentsOfFile:path];
    if (arrayOfScores == nil || [arrayOfScores count] == 0) {
        
        
        Record = 100;
        
        } else {
    NSDictionary *firstDictionary = [arrayOfScores objectAtIndex:0];
    
    
    
    Record =  [[firstDictionary objectForKey:@"scoresForName"] intValue];
    } 
    s=[NSString stringWithFormat:@"%@%lli", NSLocalizedString(@"Record: ", nil)  , Record];
    //NSLog(@"*s = %@", s);
    
    //[recordButton setAttributedTitle:nil forState:UIControlStateNormal];
    
    [recordButton setTitle:s forState:UIControlStateNormal];
    
    NSString  *ScoresinGameCenter = [[NSUserDefaults standardUserDefaults] stringForKey:@"ScoresinGameCenter"];
    
    
	
    
    
    
    s =  [NSString stringWithFormat:NSLocalizedString(@"Score in Game Center: %@", nil)   , ScoresinGameCenter];
   // NSLog(@"264 %@",s);
    // [scoreInGameCenterButton setAttributedTitle:nil forState:UIControlStateNormal];
    [scoreInGameCenterButton setTitle:s forState:UIControlStateNormal];
    
    
}


- (void) reloadScoresComplete: (GKLeaderboard*) leaderBoard error: (NSError*) error;
{
    
   // NSLog(@"reloadScoresComplete");
	if(error == NULL)
	{
        
		int64_t personalBest= leaderBoard.localPlayerScore.value;
        
		NSString *s = [NSString stringWithFormat: @"%lld", personalBest];
       
        
       
        if(bestScore>personalBest) s = [NSString stringWithFormat: @"%lld", bestScore];
        [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"ScoresinGameCenter"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        s =  [NSString stringWithFormat:NSLocalizedString(@"Score in Game Center: %@", nil) , s];
        //NSLog(@"%@",s);
       // [scoreInGameCenterButton setAttributedTitle:nil forState:UIControlStateNormal];
        [scoreInGameCenterButton setTitle:s forState:UIControlStateNormal];
        
        
		if([leaderBoard.scores count] >0)
		{
			 
            //NSLog(@"[leaderBoard.scores count] >0)");
			GKScore* allTime= [leaderBoard.scores objectAtIndex: 0];
            
            //NSLog(@"GKScore* allTime= %@", allTime);
			self.cachedHighestScore= allTime.formattedValue;
             //NSLog(@"cachedHighestScore= %@", self.cachedHighestScore);
			[gameCenterManager mapPlayerIDtoPlayer: allTime.playerID];
            
		}
	}
	else
	{
		
        NSString *s =  [NSString stringWithFormat:NSLocalizedString(@"Score in Game Center: Unavailable", nil) ];
       // [scoreInGameCenterButton setAttributedTitle:nil forState:UIControlStateNormal];
        [scoreInGameCenterButton setTitle:s forState:UIControlStateNormal];

		[self showAlertWithTitle:  NSLocalizedString(@"Score Reload Failed!", nil)
						 message: [NSString stringWithFormat:   NSLocalizedString(@"Reason: %@", nil), [error localizedDescription]]];
      
	
    
            if ([GameCenterManager isGameCenterAvailable]) {
           self.gameCenterManager = [[GameCenterManager alloc] init] ;
              //  self.gameCenterManager = [[[GameCenterManager alloc] init] autorelease];
            [self.gameCenterManager setDelegate:self];
            [self.gameCenterManager authenticateLocalUser];
            
            // [self.gameCenterManager reloadHighScoresForCategory: self.currentLeaderBoard];
            
            } else {
            
            // The current device does not support Game Center.
            
            [self showAlertWithTitle:NSLocalizedString(@"The current device does not support Game Center!", nil)
                             message: @""];
            }
        

    
    }


}


- (void) mappedPlayerIDToPlayer: (GKPlayer*) player error: (NSError*) error;
{
	if((error == NULL) && (player != NULL))
	{
	//	self.leaderboardHighScoreDescription= [NSString stringWithFormat: @"%@ got:", player.alias];
		
		if(self.cachedHighestScore != NULL)
		{
			self.leaderboardHighScoreString= self.cachedHighestScore;
            //NSLog(@"self.cachedHighestScore= %@", self.cachedHighestScore);
		}
		else
		{
			//self.leaderboardHighScoreString= @"-";
		}
        
	}
	else
	{
        NSString *s =  [NSString stringWithFormat:NSLocalizedString(@"Score in Game Center: Unavailable", nil) ];
     //   [scoreInGameCenterButton setAttributedTitle:nil forState:UIControlStateNormal];
        [scoreInGameCenterButton setTitle:s forState:UIControlStateNormal];
        
		
	}
	
}


- (void) scoreReported: (NSError*) error;
{
	if(error == NULL)
	{
        
		[self.gameCenterManager reloadHighScoresForCategory: self.currentLeaderBoard];
		[self showAlertWithTitle:  NSLocalizedString(@"High Score Reported!", nil) message:nil];
       // [self showAlertWithTitle: @"High Score Reported!" message: [NSString stringWithFormat: @"%@", [error localizedDescription]]];
        
      	}
	else
	{
		[self showAlertWithTitle:  NSLocalizedString(@"Score Reload Failed!", nil)
						 message: [NSString stringWithFormat:   NSLocalizedString(@"Reason: %@", nil), [error localizedDescription]]];
    }
    
}

- (IBAction)done:(id)sender {
    [self.gameCenterManager release];
	
    self.gameCenterManager = nil;
    self.currentLeaderBoard = nil;
    self.currentScore = nil;
    self.Record = nil;
    self.bestScore = nil;
    //NSLog(@"GameCenterController  %@", @"done pressed");
 [self.delegate GameCenterControllerDidFinish:self];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [gameCenterManager release];
    [currentLeaderBoard release];
    [array release];
    [currentScoreButton release];
    [personName release];
    
    [doneButton release];
    doneButton = nil;
    [submitScoreButton release];
    submitScoreButton = nil;
    [submitRecordButton release];
    submitRecordButton = nil;
    [ShowLeaderboardButton release];
    ShowLeaderboardButton = nil;
 

    
    [super dealloc];
}


@end

