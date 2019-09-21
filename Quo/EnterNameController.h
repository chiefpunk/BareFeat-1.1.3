


@class EnterNameController;


@protocol EnterNameControllerDelegate
- (void) EnterNameControllerDidFinish:(EnterNameController *)controller;

- (void) EnterNameControllerDidFinish2:(EnterNameController *)controller atIndex:(NSUInteger)indexOfRow;
@end

@interface EnterNameController : UIViewController {
	
	UITextField *textField;
    IBOutlet UILabel *currentScoresButton;
    
    NSString *personName;
    int scoresForName;
    
    int CurrentScoreToSave;
    
	NSMutableArray *array;
 IBOutlet UIButton *cancelButton;
 IBOutlet UIButton *saveButton;
}


@property (nonatomic, retain) NSMutableArray *array;
@property (copy, nonatomic) NSString *personName;
@property (readwrite) int scoresForName;
@property (readwrite) int CurrentScoreToSave;
@property (nonatomic, retain)  IBOutlet UILabel  *currentScoresButton;
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain)  IBOutlet UIButton *cancelButton;
@property (nonatomic, retain)  IBOutlet UIButton *saveButton;

@property (assign, nonatomic) id <EnterNameControllerDelegate> delegate;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;


@end

