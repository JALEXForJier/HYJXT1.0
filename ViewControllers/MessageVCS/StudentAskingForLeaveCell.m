//
//  StudentAskingForLeaveCell.m
//  hlJXT
//
//  Created by Jier on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "StudentAskingForLeaveCell.h"

@implementation StudentAskingForLeaveCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self UIAdd];
    }
    return self;
}

-(void)UIAdd   //添加请假列表需要控件
{
    _studentNameLabel=[[UILabel alloc]init];
    _askingStateLabel=[[UILabel alloc]init];
    _titleLabel=[[UILabel alloc]init];
    
    [self.contentView addSubview:_studentNameLabel];
    [self.contentView addSubview:_askingStateLabel];
    [self.contentView addSubview:_titleLabel];
}


-(void)UIDetailSetWithWidth:(float)width
{
    self.titleLabel.frame=CGRectMake(14*width, 8*width, 295*width, 44*width);
    self.titleLabel.font=[UIFont systemFontOfSize:19];
    self.titleLabel.textColor=MainColor;
    
    self.studentNameLabel.frame=CGRectMake(22*width, 61*width, 144*width, 21*width);
    self.studentNameLabel.font=[UIFont systemFontOfSize:15];
    self.studentNameLabel.textColor=[UIColor grayColor];
    
    self.askingStateLabel.frame=CGRectMake(242*width, 60*width, 55*width, 26*width);
    self.askingStateLabel.font=[UIFont systemFontOfSize:15];
    self.askingStateLabel.textColor=[UIColor grayColor];
}













@end
