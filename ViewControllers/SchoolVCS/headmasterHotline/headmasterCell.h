//
//  headmasterCell.h
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface headmasterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headMasterMailImageView;
@property (weak, nonatomic) IBOutlet UILabel *getMailTime;
@property (weak, nonatomic) IBOutlet UILabel *getMailTitle;
@property (weak, nonatomic) IBOutlet UIImageView *lineImage;
- (void)updateHeadMasterMailListWithModel:(id)model;
@end
