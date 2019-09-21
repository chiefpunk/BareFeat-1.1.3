//
//  OwnPhraseViewController.h
//  Quo
//
//  Created by Valeriy Petrenko on 04/11/12.
//  Copyright (c) 2012 Larisa Petrenko. All rights reserved.
//

#import <UIKit/UIKit.h>


@class OwnPhraseViewController;

@protocol OwnPhraseViewControllerDelegate
- (void)OwnPhraseViewControllerDidFinish:(OwnPhraseViewController *)controller;
@end

@interface OwnPhraseViewController : UIViewController  {
    IBOutlet  UITextView *txtViewTitle;
    IBOutlet  UITextView *txtViewAuthor;
      IBOutlet UIButton *SettingsButton;
}
@property (nonatomic, retain) UITextView *txtViewTitle;
@property (nonatomic, retain) UITextView *txtViewAuthor;
@property (assign, nonatomic) id <OwnPhraseViewControllerDelegate> delegate;
@property (nonatomic, retain)  IBOutlet UIButton *SettingsButton;

@end
