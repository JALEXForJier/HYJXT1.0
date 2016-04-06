//
//  classExerciseCell.m
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "classExerciseCell.h"

@implementation classExerciseCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)updateExerciseViewWithModel:(id)model{
    [self.exerciseImageView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"backp1.png"]];
    self.exerciseContent.text = @"阿打发发发沙发沙发沙发沙发发生";
    //label文本行数设为0即为不限行数
    self.exerciseContent.numberOfLines = 0;
    //label内容过长时自动换行
    self.exerciseContent.lineBreakMode = NSLineBreakByCharWrapping;
    self.exerciseTeacher.text = @"习大大教师";
    self.exerciseTime.text = @"2010-01-01 12:12:12";
    self.lineImage.image = [UIImage imageNamed:@"img_hline_trans_nav"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
