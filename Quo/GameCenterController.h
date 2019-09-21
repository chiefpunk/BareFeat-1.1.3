

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import <GameKit/GameKit.h>

#import "GameCenterManager.h"


@class GameCenterManager;
@class GameCenterController;


@protocol GameCenterControllerDelegate
- (void) GameCenterControllerDidFinish:(GameCenterController *)controller;
@end

@interface GameCenterController : UIViewController <UIActionSheetDelegate, GKGameCenterControllerDelegate, GameCenterManagerDelegate> {
        
    
	NSString* leaderboardHighScoreString;
    GameCenterManager *gameCenterManager;
    int64_t  currentScore;
    int64_t  Record;
    int64_t bestScore;
    NSString* currentLeaderBoard;
       
    

    NSString *personName;
    int scoresForName;
    
    int CurrentScoreToSave;
    
	NSMutableArray *array;

    IBOutlet UIButton *currentScoreButton;
    IBOutlet UIButton *doneButton;
    IBOutlet UIButton *recordButton;
    IBOutlet UIButton *scoreInGameCenterButton;
    IBOutlet UIButton *submitScoreButton;
    IBOutlet UIButton *submitRecordButton;
    IBOutlet UIButton *ShowLeaderboardButton;
    
    NSString* cachedHighestScore;
	
	
}

@property (nonatomic, retain) NSString* leaderboardHighScoreString;
@property (nonatomic, assign)    int64_t bestScore;
@property (nonatomic, retain) NSString* cachedHighestScore;

@property (nonatomic, retain)  IBOutlet UIButton *currentScoreButton;
@property (nonatomic, retain)  IBOutlet UIButton *recordButton;
@property (nonatomic, retain)  IBOutlet UIButton *scoreInGameCenterButton;
@property (nonatomic, retain)  IBOutlet UIButton *doneButton;
@property (nonatomic, retain)  IBOutlet UIButton *submitScoreButton;
@property (nonatomic, retain)  IBOutlet UIButton *submitRecordButton;
@property (nonatomic, retain)  IBOutlet UIButton *ShowLeaderboardButton;

@property (nonatomic, retain) NSMutableArray *array;
@property (copy, nonatomic) NSString *personName;
@property (readwrite) int scoresForName;
@property (readwrite) int CurrentScoreToSave;



@property (assign, nonatomic) id <GameCenterControllerDelegate> delegate;

@property (nonatomic, retain) GameCenterManager *gameCenterManager;
@property (nonatomic, assign) int64_t currentScore;
@property (nonatomic, assign) int64_t  Record;
@property (nonatomic, retain) NSString* currentLeaderBoard;


- (IBAction) showLeaderboard;
- (IBAction) showAchievements;
- (IBAction) submitScore;
- (IBAction) submitRecord;





- (IBAction)done:(id)sender;


@end

