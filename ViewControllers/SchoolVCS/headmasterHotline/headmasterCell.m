//
//  headmasterCell.m
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "headmasterCell.h"

@implementation headmasterCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)updateHeadMasterMailListWithModel:(id)model{
    self.getMailTitle.numberOfLines = 0;
    self.getMailTitle.lineBreakMode = NSLineBreakByCharWrapping;
    self.getMailTime.text = @"2016-03-25";
    self.getMailTitle.text = @"大发发沙发上大发发沙发上大发发沙发上大发发沙发上大发发沙发上";
    self.lineImage.image = [UIImage imageNamed:@"img_hline_trans_nav.png"];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
