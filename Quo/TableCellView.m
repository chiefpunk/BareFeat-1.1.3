//
//  TableViewCell.m
//  Skazka
//
//  Created by Valeriy Petrenko on 05/08/09.

//

#import "TableCellView.h"

@implementation TableCellView

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // all your stuff
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	// cellText.textColor = [UIColor redColor];
    [super setSelected:selected animated:animated];
	//cellText.textColor = [UIColor redColor];
    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}

- (void)setLabelText:(NSString *)_text;{
    
    cellText.layer.cornerRadius = 8;
    cellText.layer.borderWidth = 1.0;
 cellText.layer.borderColor = [[UIColor lightGrayColor] CGColor];

    cellText.text = _text;
}

- (void)setLabelRedColor{
    cellText.textColor=[UIColor redColor];
}
- (void)setprice:(int)ii; {
    price.layer.cornerRadius = 8;
    
    NSString *inStr = [NSString stringWithFormat: @"%d", ii];
	price.text = inStr;
}


@end
