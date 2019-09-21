#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "TableCellView.h"

@class ScoresTableViewController;

@protocol ScoresTableViewControllerDelegate
- (void)ScoresTableViewControllerDidFinish:(ScoresTableViewController *)controller;
@end

@interface ScoresTableViewController :	UIViewController <UITableViewDataSource, UITableViewDelegate>
{
   
	IBOutlet UITableView *myRecltableView;
	NSMutableArray *array;
    int ScrollPosotion;
	IBOutlet TableCellView *tblCell;
    IBOutlet UIButton *doneButton;
    IBOutlet UIButton *editButton;
}
@property (readwrite) int ScrollPosotion;
@property (assign, nonatomic) id <ScoresTableViewControllerDelegate> delegate;

@property (nonatomic, retain) IBOutlet UITableView *myRecltableView;
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain)  IBOutlet UIButton *doneButton;
@property (nonatomic, retain)  IBOutlet UIButton *editButton;
- (IBAction)enterEditMode:(id)sender;

@end