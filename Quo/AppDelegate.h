//
//  AppDelegate.h
//  Quo
//
//  Created by Valeriy Petrenko on 04/11/12.
//  Copyright (c) 2012 Larisa Petrenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
@class MainViewController;
@class BannerViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>  {
    
    AVAudioPlayer *backgroundMusic;
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainViewController *mainViewController;
+ (AppDelegate *)sharedAppDelegate;
- (void)pause: (id)sender;
- (void)myAudioPlayer;
- (void)myAudioPlayer2;
@end
