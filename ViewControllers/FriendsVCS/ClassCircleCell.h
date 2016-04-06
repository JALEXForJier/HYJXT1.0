//
//  ClassCircleCell.h
//  hlJXT
//
//  Created by Jier on 16/3/24.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassCircleCell : UITableViewCell
@property (nonatomic,strong) UIButton *logoBtn;
@property (nonatomic,strong) UILabel *userNameLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UIImageView *biankuangIv;
@property (nonatomic,strong) UILabel *bodyLabel;
@property (nonatomic,strong) UIButton *Photo1;
@property (nonatomic,strong) UIButton *Photo2;
@property (nonatomic,strong) UIButton *Photo3;
@property (nonatomic,strong) UIButton *Photo4;
@property (nonatomic,strong) UIButton *Photo5;
@property (nonatomic,strong) UIButton *Photo6;
@property (nonatomic,strong) UIView *selepatorView;
@property (nonatomic,strong) UIButton *likeBtn;
@property (nonatomic,strong) UILabel *likeNum;
@property (nonatomic,strong) NSMutableArray *buttonlist;
-(void)UIDetailSetWithWidth:(float)width;
@end
