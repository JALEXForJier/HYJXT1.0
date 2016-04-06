//
//  classExerciseCell.h
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface classExerciseCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView;//活动图片
@property (weak, nonatomic) IBOutlet UILabel *exerciseContent;//活动内容
@property (weak, nonatomic) IBOutlet UILabel *exerciseTeacher;//活动教师
@property (weak, nonatomic) IBOutlet UILabel *exerciseTime;//活动时间
@property (weak, nonatomic) IBOutlet UIImageView *lineImage;

- (void)updateExerciseViewWithModel:(id)model;

@end
