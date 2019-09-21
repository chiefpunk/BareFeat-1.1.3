//
//  MainViewController.h
//  Quo
//
//  Created by Valeriy Petrenko on 04/11/12.
//  Copyright (c) 2012 Larisa Petrenko. All rights reserved.
//

#import "FlipsideViewController.h"
//#import <sqlite3.h>
//#import <StoreKit/StoreKit.h>

#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#include <AudioToolbox/AudioToolbox.h>
#import <GameKit/GameKit.h>
#import "GameCenterManager.h"

@class GameCenterManager;


//@interface MainViewController : UIViewController <SKProductsRequestDelegate, SKPaymentTransactionObserver, FlipsideViewControllerDelegate> {
@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, GameCenterManagerDelegate> {
        GameCenterManager *gameCenterManager;
    
    UIView *touchView;
    
    UILabel *currentScoreLabel;
	UIWebView *webView;
    NSMutableArray *slova;
    int databaseNumber, zapiseyvBD;
 //   sqlite3 *database;
    int _puls;
    NSString *s1;
	NSString *s2;
    int currentLanguge;
    UIAlertController  *purchaseActivityIndicator;
    UIAlertController *askToPurchase;
    BOOL KUPLEN;
    BOOL TransitonFinish;
    IBOutlet UIButton *greekLetter;
    BOOL alertShowing;
    NSString *path;
    BOOL BecomeActive;
    NSMutableString *currentPage;
    BOOL touchViewOnOf;
    BOOL SoundBackground;
    BOOL SoundFlipNumber;
    BOOL PlayFlipSound;
    BOOL SoundFlipOn;
    int  Hod; /* номер хода от 1 до 3 включительно */
    int  currentTriangle; /* номер  от 1 до 4 включительно */
    int  previousTriangle; /* предыдуший номер.  0 инициализация */
    int  color1triangle; /**/
    int  color1nextTriangle; /**/
    int  color2triangle; /**/
    int  color2nextTriangle; /**/
    int  color3triangle; /**/
    int  color3nextTriangle; /**/
    int  color4triangle; /**/
    int  color4nextTriangle; /**/
    int CurrentLevel;
    int     OldCurrentLevel;
    int CurrentGrade;
    int     OldCurrentGrade;
    int CurrentScore;
    
	CFURLRef		soundFileURLRef1;
	SystemSoundID	soundFileObject1;
    
	CFURLRef		soundFileURLRef2;
	SystemSoundID   soundFileObject2;
    
    
	CFURLRef		soundFileURLRef3;
	SystemSoundID   soundFileObject3;
    
    UIImageView *lockRight1;
    UIImageView *lockBottom2;
    UIImageView *lockLeft3;
    UIImageView *lockTop4;
}

@property (assign, nonatomic) id <GameCenterControllerDelegate> delegate;

@property (nonatomic, retain) GameCenterManager *gameCenterManager;


@property (nonatomic, retain) IBOutlet UIImageView *lockRight1;
@property (nonatomic, retain) IBOutlet UIImageView *lockBottom2;
@property (nonatomic, retain) IBOutlet UIImageView *lockLeft3;
@property (nonatomic, retain) IBOutlet  UIImageView *lockTop4;



@property (readwrite)	CFURLRef		soundFileURLRef1;
@property (readonly)	SystemSoundID   soundFileObject1;


@property (readwrite)	CFURLRef		soundFileURLRef2;
@property (readonly)	SystemSoundID   soundFileObject2;

@property (readwrite)	CFURLRef		soundFileURLRef3;
@property (readwrite)	SystemSoundID   soundFileObject3;

@property (readwrite) int  color1triangle; /**/
@property (readwrite) int  color1nextTriangle; /**/
@property (readwrite) int  color2triangle; /**/
@property (readwrite) int  color2nextTriangle; /**/
@property (readwrite) int  color3triangle; /**/
@property (readwrite) int  color3nextTriangle; /**/
@property (readwrite) int  color4triangle; /**/
@property (readwrite) int  color4nextTriangle; /**/
@property (readwrite) int  currentTriangle; /* номер  от 1 до 4 включительно */
@property (readwrite) int  previousTriangle; /* предыдуший номер.  0 инициализация */
@property (readwrite) int Hod;  /* номер хода от 1 до 3 включительно */
@property (assign) BOOL SoundFlipOn;
@property (assign) BOOL SoundFlipNumber;
@property (assign) BOOL SoundBackground;
@property (nonatomic, retain)  NSMutableString *currentPage;
@property (assign) BOOL alertShowing, BecomeActive;
@property (assign) BOOL PlayFlipSound;
@property (assign) BOOL TransitonFinish;
@property (assign) BOOL KUPLEN;
@property (assign) BOOL touchViewOnOf;
@property (readwrite) int CurrentLevel;
@property (readwrite) int OldCurrentLevel;
@property (readwrite) int CurrentGrade;
@property (readwrite) int OldCurrentGrade;
@property (readwrite) int CurrentScore;
@property (nonatomic, retain)  UIAlertController  *purchaseActivityIndicator;
@property (readwrite) int currentLanguge;
@property (nonatomic, retain) NSString *s1;
@property (nonatomic, retain) NSString *s2;
@property (nonatomic, retain) NSString *path;
@property (readwrite) int _puls;
@property (nonatomic, retain) IBOutlet UIView *touchView;
@property (nonatomic, retain) IBOutlet UILabel *currentScoreLabel;
@property (nonatomic, retain) IBOutlet UIButton *greekLetter;
@property (readwrite) int databaseNumber;
@property (readwrite) int zapiseyvBD;
@property (nonatomic, retain) NSMutableArray *slova;
@property (nonatomic, retain) IBOutlet UIWebView *webView;
//@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
- (void) newLevelStart;
- (void) showHideLocks;
- (void) resetAfterFinishLevel;
- (IBAction) playSystemSound1: (id) sender;
- (IBAction) playSystemSound2: (id) sender;
//- (IBAction)BuyButtonPressed:(id)sender;
- (IBAction)showInfo:(id)sender;
- (NSString*)ourColors:(int)numberOfCOLOR;
- (void)ChengeTriangleColors;
- (NSString*)setLevelLetter;
- (void) setNewLevelColors;


@end
