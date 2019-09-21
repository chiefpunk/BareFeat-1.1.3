/*      */

#import "BannerViewController.h"


NSString * const BannerViewActionWillBegin = @"BannerViewActionWillBegin";
NSString * const BannerViewActionDidFinish = @"BannerViewActionDidFinish";

@interface BannerViewController () <ADBannerViewDelegate>

@end

@implementation BannerViewController {
    ADBannerView *_bannerView;
    UIViewController *_contentController;
}

- (instancetype)initWithContentViewController:(UIViewController *)contentController
{
    self = [super init];
    if (self != nil) {
        // On iOS 6 ADBannerView introduces a new initializer, use it when available.
        if ([ADBannerView instancesRespondToSelector:@selector(initWithAdType:)]) {
            _bannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
        } else {
            _bannerView = [[ADBannerView alloc] init];
        }
        _bannerView.delegate = self;
        _contentController = contentController;
    }
    
    //Моя вставка
  
	
    
    //
    return self;
}

- (void)loadView
{
    
    
    
    
    UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [contentView addSubview:_bannerView];
    /////
    [self addChildViewController:_contentController];
    [contentView addSubview:_contentController.view];
    [_contentController didMoveToParentViewController:self];
    self.view = contentView;
    
}

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return [_contentController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}
#endif

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [_contentController preferredInterfaceOrientationForPresentation];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [_contentController supportedInterfaceOrientations];
}

//bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);

- (void)viewDidLayoutSubviews
{
     
    
    
    CGRect contentFrame = self.view.bounds, bannerFrame = CGRectZero;
     
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
    // If configured to support iOS <6.0, then we need to set the currentContentSizeIdentifier in order to resize the banner properly.
    // This continues to work on iOS 6.0, so we won't need to do anything further to resize the banner.
    if (contentFrame.size.width < contentFrame.size.height) {
        _bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    } else {
        _bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    }
    bannerFrame = _bannerView.frame;
#else
    // If configured to support iOS >= 6.0 only, then we want to avoid currentContentSizeIdentifier as it is deprecated.
    // Fortunately all we need to do is ask the banner for a size that fits into the layout area we are using.
    // At this point in this method contentFrame=self.view.bounds, so we'll use that size for the layout.
    bannerFrame.size = [_bannerView sizeThatFits:contentFrame.size];
#endif
    
    if (_bannerView.bannerLoaded) {
        contentFrame.size.height -= bannerFrame.size.height;
        bannerFrame.origin.y = contentFrame.size.height;
        
        
        
    } else {
        bannerFrame.origin.y = contentFrame.size.height;
    }
    
    _contentController.view.frame = contentFrame;
    _bannerView.frame = bannerFrame;

    /*
      ////NSLog(@"contentFrameOLD =%@", NSStringFromCGRect(contentFrameOLD));
    ////NSLog(@"*****banner size changed  contentFrameOLD = %f",  contentFrameOLD.size.height);
    
  ////NSLog(@"contentFrame =%@", NSStringFromCGRect(contentFrame));
    ////NSLog(@"banner size changed  contentFrame NEW  = %f",  contentFrame.size.height);
    if ((contentFrameOLD.size.height != contentFrame.size.height ) || (contentFrameOLD.size.height != contentFrame.size.height )) {
        
       
        
        
        contentFrameOLD.size.height = contentFrame.size.height;
          
        ////NSLog(@"*****banner size changed  NEW contentFrameOLD = %f",  contentFrameOLD.size.height);
        
        
     }
     */


// [[NSNotificationCenter defaultCenter] postNotificationName:BannerViewActionWillBegin object:self];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    }];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    }];
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
 
}

@end
