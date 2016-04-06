//
//  notifyCell.m
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "notifyCell.h"

#define widthScale SCREEN_WIDTH/320

@implementation notifyCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)updateCellWithModel:(id)model{
    self.notifyTitle.text = @"发发发的说法dsafasfasfasfasfasfdasas是方式发放发发发发";
    //label文本行数设为0即为不限行数
    self.notifyTitle.numberOfLines = 0;
    //label内容过长时自动换行
    self.notifyTitle.lineBreakMode = NSLineBreakByCharWrapping;
    self.notifyPeople.text = @"北大校长秘书处";
    self.notifyTime.text = @"2010-01-01 12:12:12";
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
