//
//  teacherDetailCommandCell.m
//  咨询Demo
//
//  Created by admin on 16/3/24.
//  Copyright © 2016年 zhuxianhong. All rights reserved.
//

#import "teacherDetailCommandCell.h"
#define widthScale SCREEN_WIDTH/320
@implementation teacherDetailCommandCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)updateDetailWithModel:(id)array{
    CGSize size = CGSizeMake(320*widthScale, CGFLOAT_MAX);
    //label文本行数设为0即为不限行数
    self.commendDetail.numberOfLines = 0;
    //label内容过长时自动换行
    self.commendDetail.lineBreakMode = NSLineBreakByCharWrapping;
    self.commendDetail.text = @"阿打发发发沙发沙发沙\n发沙发发生阿打发发发沙发沙发沙发沙发发生阿打发发发沙发沙发沙发\n沙发发生阿打发发发沙发沙发\n沙发沙发发生";
//    self.commendDetail.text = [array objectAtIndex:indexPath.row];
    //根据内容多少计算行高
    CGSize requireSize = [self.commendDetail.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    CGRect rect = self.commendDetail.frame;
    rect.size.height = requireSize.height;
    self.commendDetail.frame = CGRectMake(25*widthScale, 8*widthScale, 287*widthScale, (requireSize.height+10)*widthScale);
    
    self.commendDetail.frame = rect;
    CGRect rectView = self.frame;
    rectView = CGRectMake(0, 0, self.bounds.size.width,self.bounds.origin.y+self.commendDetail.bounds.origin.y+requireSize.height+15*widthScale);
    self.frame = rectView;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
