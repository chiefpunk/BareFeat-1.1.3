//
//  AppDelegate.m
//  Quo
//
//  Created by Valeriy Petrenko on 04/11/12.
//  Copyright (c) 2012 Larisa Petrenko. All rights reserved.
//

#import "AppDelegate.h"
#include <sys/xattr.h>
#import "MainViewController.h"
#import "BannerViewController.h"

@implementation AppDelegate {
    BannerViewController *_bannerViewController;
    
}



- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
    const char* filePath = [[URL path] fileSystemRepresentation];
    
    const char* attrName = "com.apple.MobileBackup";
    u_int8_t attrValue = 1;
    
    int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
    return result == 0;
}



+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *) [UIApplication sharedApplication].delegate;
}

- (NSString *)pathForTemporaryFileWithPrefix:(NSString *)prefix
{
    NSString *  result;
    CFUUIDRef   uuid;
    CFStringRef uuidStr;
    
    uuid = CFUUIDCreate(NULL);
    assert(uuid != NULL);
    
    uuidStr = CFUUIDCreateString(NULL, uuid);
    assert(uuidStr != NULL);
    
    result = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-%@", prefix, uuidStr]];
    assert(result != nil);
    
    CFRelease(uuidStr);
    CFRelease(uuid);
    //////////NSLog(@"pathForTemporaryFileWithPrefix result=%@", result);
    return result;
    
    
}


+ (void)initialize
// Set up our default preferences.  We can't do this in -applicationDidFinishLaunching:
// because it's too late; the view controller's -viewDidLoad method has already run
// by the time applicationDidFinishLaunching: is called.
{
    if ([self class] == [AppDelegate class]) {
        NSString *      initialDefaultsPath;
        NSDictionary *  initialDefaults;
        
        initialDefaultsPath = [[NSBundle mainBundle] pathForResource:@"InitialDefaults" ofType:@"plist"];
        assert(initialDefaultsPath != nil);
        
        initialDefaults = [NSDictionary dictionaryWithContentsOfFile:initialDefaultsPath];
        assert(initialDefaults != nil);
        
        // If we're running on the device certain defaults don't make any sense
        // (specifically, the upload defaults, which reference localhost), so
        // we nix them.
        /*
         #if ! TARGET_IPHONE_SIMULATOR
         {
         NSMutableDictionary *   initialDefaultsChanged;
         
         initialDefaultsChanged = [initialDefaults mutableCopy];
         assert(initialDefaultsChanged != nil);
         
         [initialDefaultsChanged setObject:@"" forKey:@"CreateDirURLText"];
         [initialDefaultsChanged setObject:@"" forKey:@"PutURLText"];
         
         initialDefaults = initialDefaultsChanged;
         }
         #endif
         */
        [[NSUserDefaults standardUserDefaults] registerDefaults:initialDefaults];
    }
}




// Копирует базу данных bookmarks.plist из ресурсов приложения в папку Documents на iPhone
-(void)createEditableCopyOfDatabaseIfNeeded {
    
    
    //************ Имитируем покупку
    
    [[NSUserDefaults standardUserDefaults] setObject:@"KUPLEN"  forKey:@"KupitIliVosstanovit"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //************ Закончили имитацию покупки
    
    
	BOOL success;
	NSError *error;
	// Create file manager
	//NSFileManager *fileMgr = [NSFileManager defaultManager];
	
	
    
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    
	
	
	
	paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	documentsDirectory = [paths objectAtIndex:0];
	/*
     NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"1.sql"];
     // // // // ////////NSLog(@" documentsDirectory writableDBPath:");
     // // // // ////////NSLog(writableDBPath);
     
     NSFileManager *fileManager = [NSFileManager defaultManager];
     success = [fileManager fileExistsAtPath:writableDBPath];
     
     if (success) return;
     // The writable database does not exist, so copy the default to the appropriate location.
     NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"1.sql"];
     success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
     if (!success) {
     NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
     } else {
     // // ////////NSLog(@" 0.sql  copied to Documents folder.");
     // // ////////NSLog(@"\n\n\n writableDBPath:");
     // // ////////NSLog(writableDBPath);
     
     //Setting the Do Not Backup Extended Attribute to  prevent files from being backed up to iCloud and iTunes
     NSURL *fileURL = [NSURL fileURLWithPath:writableDBPath];
     [self addSkipBackupAttributeToItemAtURL:fileURL];
     //end Setting the Do Not Backup
     
     }
     */
	//*************
    /*
     writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"0.sql"];
     // // // // ////////NSLog(@" documentsDirectory writableDBPath:");
     // // // // ////////NSLog(writableDBPath);
     
     fileManager = [NSFileManager defaultManager];
     success = [fileManager fileExistsAtPath:writableDBPath];
     
     if (success) return;
     // The writable database does not exist, so copy the default to the appropriate location.
     defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"0.sql"];
     success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
     if (!success) {
     NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
     } else {
     // // ////////NSLog(@" 0.sql  copied to Documents folder.");
     // // ////////NSLog(@"\n\n\n writableDBPath:");
     // // ////////NSLog(writableDBPath);
     
     //Setting the Do Not Backup Extended Attribute to  prevent files from being backed up to iCloud and iTunes
     NSURL *fileURL = [NSURL fileURLWithPath:writableDBPath];
     [self addSkipBackupAttributeToItemAtURL:fileURL];
     //end Setting the Do Not Backup
     
     }
     */
	//*************
    /*
     writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"2.sql"];
     // // // // ////////NSLog(@" documentsDirectory writableDBPath:");
     // // // // ////////NSLog(writableDBPath);
     
     fileManager = [NSFileManager defaultManager];
     success = [fileManager fileExistsAtPath:writableDBPath];
     
     if (success) return;
     // The writable database does not exist, so copy the default to the appropriate location.
     defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"2.sql"];
     success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
     if (!success) {
     NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
     } else {
     // // ////////NSLog(@" 0.sql  copied to Documents folder.");
     // // ////////NSLog(@"\n\n\n writableDBPath:");
     // // ////////NSLog(writableDBPath);
     
     //Setting the Do Not Backup Extended Attribute to  prevent files from being backed up to iCloud and iTunes
     NSURL *fileURL = [NSURL fileURLWithPath:writableDBPath];
     [self addSkipBackupAttributeToItemAtURL:fileURL];
     //end Setting the Do Not Backup
     
     }
     */
	//*************
    /*
     writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"3.sql"];
     // // // // ////////NSLog(@" documentsDirectory writableDBPath:");
     // // // // ////////NSLog(writableDBPath);
     
     fileManager = [NSFileManager defaultManager];
     success = [fileManager fileExistsAtPath:writableDBPath];
     
     if (success) return;
     // The writable database does not exist, so copy the default to the appropriate location.
     defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"3.sql"];
     success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
     if (!success) {
     NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
     } else {
     // // ////////NSLog(@" 0.sql  copied to Documents folder.");
     // // ////////NSLog(@"\n\n\n writableDBPath:");
     // // ////////NSLog(writableDBPath);
     
     //Setting the Do Not Backup Extended Attribute to  prevent files from being backed up to iCloud and iTunes
     NSURL *fileURL = [NSURL fileURLWithPath:writableDBPath];
     [self addSkipBackupAttributeToItemAtURL:fileURL];
     //end Setting the Do Not Backup
     }
     
     */
    
    //***********************
    // COPY of   InitialDefaults.plist
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"InitialDefaults.plist"];
	// // //////////NSLog(@" documentsDirectory writableDBPath:");
	// // //////////NSLog(writableDBPath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
	
    fileManager = [NSFileManager defaultManager];
	
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) return;
    // The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"InitialDefaults.plist"];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable Initial file with message '%@'.", [error localizedDescription]);
    } else {
        ////////////NSLog(@"    copied to Documents folder.");
		//// // //////////NSLog(@"\n\n\n writableDBPath:");
		//// // //////////NSLog(writableDBPath);
    }
    // END of COPY of  InitialDefaults.plist
    
    
     writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"Data.plist"];
	// // //////////NSLog(@" documentsDirectory writableDBPath:");
	// // //////////NSLog(writableDBPath);
    fileManager = [NSFileManager defaultManager];
	
	
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) return;
    // The writable database does not exist, so copy the default to the appropriate location.
     defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Data.plist"];
    
   // //////NSLog(@"defaultDBPath %@",defaultDBPath);
    
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable Data.plist file with message '%@'.", [error localizedDescription]);
    } else {
        ////////////NSLog(@"    copied to Documents folder.");
		//// // //////////NSLog(@"\n\n\n writableDBPath:");
		//// // //////////NSLog(writableDBPath);
    }
    // END of COPY of  InitialDefaults.plist
    

    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)myAudioPlayer2
{
    NSString *backgroundMusicPath2 = [[NSBundle mainBundle] pathForResource: @"voshebstvo" ofType: @"m4a"];
	NSURL *backgroundMusicURL2 = [[NSURL alloc] initFileURLWithPath:backgroundMusicPath2];
	AVAudioPlayer *backgroundMusic2 = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL2 error:nil];
	
    
    
    BOOL soundFinishLevelSwitch =  [[NSUserDefaults standardUserDefaults] boolForKey:@"soundFinishLevelSwitch"];
    // //////NSLog(@" sound1SwitchTrigger= %@", sound1SwitchTrigger ? @"Yes" : @"No");
    
    if (soundFinishLevelSwitch)
	{
        [backgroundMusic2 play];
        
    }
    
    
    
}

- (void)myAudioPlayer
{
    NSString *backgroundMusicPath = [[NSBundle mainBundle] pathForResource: @"BareFeet" ofType: @"mp3"];
	NSURL *backgroundMusicURL = [[NSURL alloc] initFileURLWithPath:backgroundMusicPath];
	backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:nil];
	
    BOOL sound1SwitchTrigger =  [[NSUserDefaults standardUserDefaults] boolForKey:@"sound1Switch"];
    // //////NSLog(@" sound1SwitchTrigger= %@", sound1SwitchTrigger ? @"Yes" : @"No");
    
    if (sound1SwitchTrigger )
	{
        [backgroundMusic play];
        
    }
    
    
	backgroundMusic.numberOfLoops = -1;
}

- (void)pause: (id)sender

{
    if([backgroundMusic isPlaying]){
        [backgroundMusic pause];
    } else {
        [backgroundMusic play];
    }
    
}

- (void)dealloc
{
    [_window release];
    [_mainViewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
        //////NSLog(@"userDefaultsDefaults");
    
   // NSInteger isn't an object -- it's simply typecast to int on 32-bit or long on 64-bit. Since NSDictionary can only store objects, you need to wrap the integer into an object before you can store it. Try this:
    
   // NSInteger temp = 20;
    //[userSettingsFromFile setObject:[NSNumber numberWithInteger:temp] forKey:@"aTemp"];
    
    NSDictionary *userDefaultsDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
                                      
                                        
                                          @"Starter", @"CurrentUser",
                                          FALSE, @"chengedLevelOrGrade",
                                         100, @"Record",
                                         100, @"CurrentScore",
                                         1, @"CurrentLevel",
                                         1, @"CurrentGrade",
                                          nil];
    /*
    NSDictionary *userDefaultsDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [NSNumber numberWithInt:1], @"CurrentLevel",
                                          [NSNumber numberWithInt:1], @"CurrentGrade",
                                          [NSNumber numberWithInt:100], @"CurrentScore",
                                            @"Starter", @"CurrentUser",
                                         FALSE, @"chengedLevelOrGrade",
                                          100, @"Record",
                                          nil];
     
     */
    
    //////NSLog(@"userDefaultsDefaults2");
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:userDefaultsDefaults];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"sound1Switch"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"sound2Switch"];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"soundFinishLevelSwitch"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    ////////NSLog(@"localeIdentifier: %@", [[NSLocale currentLocale] localeIdentifier]);
    
    //  //////NSLog(@"preferredLanguages: %@",  [[NSLocale preferredLanguages] objectAtIndex:0]);
    [self   myAudioPlayer];
    [self createEditableCopyOfDatabaseIfNeeded];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
   
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.mainViewController = [[[MainViewController alloc] initWithNibName:@"MainViewController_iPhone" bundle:nil] autorelease];
    } else {
        self.mainViewController = [[[MainViewController alloc] initWithNibName:@"MainViewController_iPad" bundle:nil] autorelease];
    }
    
    
    
    _bannerViewController = [[BannerViewController alloc] initWithContentViewController:self.mainViewController];
    
    self.window.rootViewController = _bannerViewController;

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    //  //////NSLog(@"%@", @"applicationWillResignActive");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
