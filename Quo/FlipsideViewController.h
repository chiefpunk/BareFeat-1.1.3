//
//  FlipsideViewController.h
//  Quo
//
//  Created by Valeriy Petrenko on 04/11/12.
//  Copyright (c) 2012 Larisa Petrenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "OwnPhraseViewController.h"
#import "AppDelegate.h"
#import "EnterNameController.h"
#import "GameCenterController.h"
#import "ScoresTableViewController.h"
#import <QuartzCore/QuartzCore.h>

//#import "GameCenterController.h"
@class GameCenterController;

@class EnterNameController;
@class FlipsideViewController;
@class ScoresTableViewController;
@class OwnPhraseViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

//@protocol ScoresTableViewControllerDelegate
//- (void)ScoresTableViewControllerDidFinish:(ScoresTableViewController *)controller;
//@end

@interface FlipsideViewController : UIViewController <UIAlertViewDelegate, MFMailComposeViewControllerDelegate, GameCenterControllerDelegate, EnterNameControllerDelegate, ScoresTableViewControllerDelegate, OwnPhraseViewControllerDelegate>
//,
//GameCenterControllerDelegate>
{
    UIAlertController *askToReset;
    UIAlertController *askToRestart;
    IBOutlet UIButton *slavamaxButton;
    
    EnterNameController *ivEnterNameController;
    IBOutlet UISwitch *sound1Switch;
    IBOutlet UISwitch *sound2Switch;
    
    IBOutlet UISwitch *soundFinishLevelSwitch;
    IBOutlet UIButton *mycopyButton;
    IBOutlet UISegmentedControl *segmentContent;
    IBOutlet UISegmentedControl *segmentLanguage;
    IBOutlet UILabel *labelPuls;
    BOOL chengedLevelOrGrade;
    int _puls;
     IBOutlet UISlider *slider;
    int databaseNumber;
    int Record;
    
    IBOutlet UIButton *PlayGameDone;
    IBOutlet UIButton *HowToPlay;
    IBOutlet UIButton *currentScore;
    IBOutlet UIButton *CurrentGrade;
    IBOutlet UIButton *currentLevel;
    IBOutlet UIButton *currentRecord;
    IBOutlet UIButton *saveScoreButton;
    IBOutlet UIButton *backSoundButton;
    IBOutlet UIButton *flipSoundButton;
    IBOutlet UIButton *levelSoundButton;
    IBOutlet UIButton *resetGameButton;
    IBOutlet UIButton *startGameButton;
    IBOutlet UIButton *GameCenterButton;
}
@property (nonatomic, retain) EnterNameController *ivEnterNameController;

@property (assign) BOOL chengedLevelOrGrade;
@property (readwrite) int databaseNumber;
@property (readwrite) int Record;
@property (readwrite) int _puls;
@property (assign, nonatomic) id <FlipsideViewControllerDelegate> delegate;
//@property (assign, nonatomic) id <ScoresTableViewControllerDelegate> delegate;
@property (nonatomic, retain) UISwitch *sound1Switch;

@property (nonatomic, retain)  IBOutlet UIButton *PlayGameDone;
@property (nonatomic, retain)  IBOutlet UIButton *HowToPlay;
@property (nonatomic, retain)  IBOutlet UIButton *currentScore;
@property (nonatomic, retain)  IBOutlet UIButton *CurrentGrade;
@property (nonatomic, retain)  IBOutlet UIButton *currentLevel;
@property (nonatomic, retain)  IBOutlet UIButton  *saveScoreButton;
@property (nonatomic, retain)  IBOutlet UIButton *currentRecord;
@property (nonatomic, retain)  IBOutlet UIButton *backSoundButton;
@property (nonatomic, retain)  IBOutlet UIButton *flipSoundButton;
@property (nonatomic, retain)  IBOutlet UIButton *levelSoundButton;
@property (nonatomic, retain)  IBOutlet UIButton *resetGameButton;
@property (nonatomic, retain)  IBOutlet UIButton *startGameButton;
@property (nonatomic, retain)  IBOutlet UIButton *GameCenterButton;
@property (nonatomic, retain)  IBOutlet UIButton *slavamaxButton;

@property (nonatomic, retain) UISwitch *sound2Switch;
@property (nonatomic, retain)  UISwitch *soundFinishLevelSwitch;

@property (nonatomic, retain) UIButton *mycopyButton;
@property (nonatomic, retain) UISegmentedControl *segmentContent;
@property (nonatomic, retain) UISegmentedControl *segmentLanguage;
@property (nonatomic, retain) UILabel *labelPuls;
@property (nonatomic, retain)  UISlider *slider;

- (IBAction) resetGame:(id)sender;
- (IBAction) restartGame:(id)sender;

- (IBAction) soundFinishLevelPressed:(id)sender;
- (IBAction) soundFinishLevelChanged:(id)sender;

- (IBAction) moreApp: (id) sender;
- (IBAction) setOwnPhrase:(id)sender;
- (IBAction) levelNamePressed:(id)sender;
- (IBAction) gradeNamePressed:(id)sender;
- (IBAction) pulsPressed: (id) sender;
- (IBAction) changeSegmentContent;
- (IBAction) changeSegmentLanguage;
- (IBAction) switch1Changed: (id) sender;

- (IBAction) switch2Changed: (id) sender;
- (void) StartTheGameAgain;

- (IBAction) recoredPressed:(id)sender;
- (IBAction) saveScorePressed: (id) sender;
- (IBAction)done:(id)sender;
- (void) setLevelName;
- (void) setGrade;
- (IBAction) switch1Pressed: (id) sender;
- (IBAction) switch2Pressed: (id) sender;
- (IBAction)showMailerKeyboard:(id)sender;
- (void)displayComposerSheetKeyboard;
- (IBAction)sizeSlideAction:(id)sender;
- (void)launchMailAppOnDeviceKeyboard;
@end
