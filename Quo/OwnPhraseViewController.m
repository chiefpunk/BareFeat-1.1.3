//
//  OwnPhraseViewController.m
//  Quo
//
//  Created by Valeriy Petrenko on 04/11/12.
//  Copyright (c) 2012 Larisa Petrenko. All rights reserved.
//

#import "OwnPhraseViewController.h"

@interface OwnPhraseViewController ()

@end

@implementation OwnPhraseViewController

@synthesize txtViewTitle;
@synthesize txtViewAuthor, SettingsButton;

- (void)viewDidDisappear:(BOOL)animated
{
   }

- (void)viewDidAppear:(BOOL)animated
{
    ////////NSLog(@"%@", @"OwnPhraseViewController viewDidAppear");
}




- (void)viewWillAppear:(BOOL)animated {
    
           ////////NSLog(@"%@", @"OwnPhraseViewController viewWillAppear"); 
    
    
   NSString *s1  =  [[NSUserDefaults standardUserDefaults] stringForKey:@"ownTitle"];
    
    
       NSString * s2  =  [[NSUserDefaults standardUserDefaults] stringForKey:@"ownAuthor"];
    if ((!s1)||(!s2)) {
        
        s1 =  @"Don’t be trapped by dogma — which is living with the results of other people’s thinking. Don’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.";
        s2 =   @"Steve Jobs";
        
        if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"]) {
            s1 = @"Не попадайте в ловушку догмы. Не позволяйте шуму чужих мнений перебить ваш внутренний голос. И самое важное, имейте храбрость следовать своему сердцу и интуиции. Они каким-то образом уже знают то, кем вы хотите стать на самом деле.";
            s2 =   @"Стив Джобс";
        }
        
    }
    
    txtViewTitle.text=s1;
    txtViewAuthor.text=s2;
    
    [txtViewTitle becomeFirstResponder];
    
    ////////NSLog(  @"s2 author = %@", s2);
    ////////NSLog(@"s1 title %@", s1);

    
    
}

- (void)dealloc
{

    [txtViewTitle release];
    txtViewTitle = nil;
    [txtViewAuthor release];
    txtViewAuthor = nil;
    
    [SettingsButton release];
    SettingsButton = nil;
    
    [super dealloc];
}

- (BOOL)shouldAutorotate {
     ////////NSLog(@"%@", @"OwnPhraseViewController shouldAutorotate");
    return YES;
}
/*
-(NSUInteger)supportedInterfaceOrientations{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    ////////NSLog(@"%@", @"supportedInterfaceOrientations Phone - currentDevice");
          return UIInterfaceOrientationMaskPortrait;
    } else {
          
            ////////NSLog(@"%@", @"iPad - currentDevice");
        return UIInterfaceOrientationMaskAll;
         }
}
*/
 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  //  UIColor *myColorBorder =    [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.0];
    SettingsButton.layer.borderWidth = 1;
  SettingsButton.layer.borderColor = [UIColor yellowColor].CGColor;
     //   SettingsButton.layer.borderColor=[myColorBorder CGColor];
    SettingsButton.layer.cornerRadius = 8;
    SettingsButton.layer.masksToBounds = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Actions

- (IBAction)done:(id)sender
{

    ////////NSLog(@"%@", @"OwnPhraseViewController done");
    [[NSUserDefaults standardUserDefaults] setObject:  txtViewAuthor.text forKey:@"ownAuthor"];
    [[NSUserDefaults standardUserDefaults] setObject:    txtViewTitle.text  forKey:@"ownTitle"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    ////////NSLog(@" txtViewTitle.text %@",  txtViewTitle.text);
    
    [self.delegate OwnPhraseViewControllerDidFinish:self];
}

@end
