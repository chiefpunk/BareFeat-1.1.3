//
//  TableViewCell.h
//  Skazka
//
//  Created by Valeriy Petrenko on 05/08/09.

//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>


@interface TableCellView : UITableViewCell {
	IBOutlet UILabel *cellText;
	IBOutlet UILabel *price;
}

- (void)setLabelText:(NSString *)_text;
- (void)setLabelRedColor;
- (void)setprice:(int)ii;
@end