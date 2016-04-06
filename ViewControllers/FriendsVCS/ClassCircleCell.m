//
//  ClassCircleCell.m
//  hlJXT
//
//  Created by Jier on 16/3/24.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "ClassCircleCell.h"

@implementation ClassCircleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self UIAdd];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)UIAdd   //添加朋友圈需要控件
{
    _logoBtn=[[UIButton alloc]init];
    _userNameLabel=[[UILabel alloc]init];
    _timeLabel=[[UILabel alloc]init];
    _biankuangIv=[[UIImageView alloc]init];
    _bodyLabel=[[UILabel alloc]init];
    _selepatorView=[[UIView alloc]init];
    _likeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _likeNum=[[UILabel alloc]init];
    _Photo1=[[UIButton alloc]init];
    _Photo2=[[UIButton alloc]init];
    _Photo3=[[UIButton alloc]init];
    _Photo4=[[UIButton alloc]init];
    _Photo5=[[UIButton alloc]init];
    _Photo6=[[UIButton alloc]init];
    
    //通过buttontag控制相应的照片按钮
    _Photo1.tag = 1;
    _Photo2.tag = 2;
    _Photo3.tag = 3;
    _Photo4.tag = 4;
    _Photo5.tag = 5;
    _Photo6.tag = 6;
    
      self.buttonlist=[[NSMutableArray alloc]initWithObjects:_Photo1,_Photo2,_Photo3,_Photo4,_Photo5,_Photo6, nil];
    
    [self.contentView addSubview:_biankuangIv];
    [self.contentView addSubview:_logoBtn];
    [self.contentView addSubview:_userNameLabel];
    [self.contentView addSubview:_timeLabel];
    [self.contentView addSubview:_bodyLabel];
    [self.contentView addSubview:_selepatorView];
    [self.contentView addSubview:_likeBtn];
    [self.contentView addSubview:_likeNum];
    for (UIButton *btn in _buttonlist) {
        [self.contentView addSubview:btn];
        btn.hidden=YES;
    }
    
}

-(void)UIDetailSetWithWidth:(float)width
{
    _logoBtn.frame=CGRectMake(14*width, 3*width , 40*width, 40*width);
   [_logoBtn setBackgroundImage:[UIImage imageNamed:@"photo2.jpg"] forState:UIControlStateNormal];
    _userNameLabel.frame=CGRectMake(70*width, 27*width , 125*width, 21*width);
    _userNameLabel.text=@"黎球";
    
    _timeLabel.frame=CGRectMake(170*width, 27*width , 142*width, 21*width);
    _timeLabel.text=@"2015-10-31 10:00";
    [_timeLabel setFont:[UIFont systemFontOfSize:11]];
    
    _biankuangIv.frame=CGRectMake(8*width, 21*width , 311*width, 44*width);
    _biankuangIv.image=[UIImage imageNamed:@"lantiao@2x.png"];
    
    _bodyLabel.frame=CGRectMake(18*width, 67*width , 285*width, 0*width);
    [_bodyLabel setFont:[UIFont systemFontOfSize:13]];
    _bodyLabel.lineBreakMode=UILineBreakModeClip;
    _bodyLabel.numberOfLines=0;
    NSDictionary *fontdic=[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13],NSFontAttributeName, nil];
    CGSize size=[_bodyLabel.text boundingRectWithSize:CGSizeMake(285*width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontdic context:nil].size;
    _bodyLabel.frame=CGRectMake(18*width, 67*width , 285*width, size.height);
    
    _selepatorView.backgroundColor=[UIColor grayColor];
    
    [_likeBtn setImage:[UIImage imageNamed:@"dianzan@2x.png"] forState:UIControlStateNormal];
    _likeNum.font=[UIFont systemFontOfSize:11];
    _likeNum.text=@"56";   //点赞数目
    
    int photoState = 0;
    
    //设置照片按钮
    if (photoState == 0) {
  //当没照片的时候
        _selepatorView.frame=CGRectMake(18*width, 70*width+size.height, 285*width, 1);
        _likeBtn.frame=CGRectMake(237*width, 79*width+size.height , 20*width, 21*width);
        _likeNum.frame=CGRectMake(259*width, 79*width+size.height , 56*width, 21*width);
        self.frame = CGRectMake(0, 0 , 320*width ,100*width+size.height);
        
    }
    else if (photoState == 1)
    {
        //照片数少于4张的时候
        
    }
    else if (photoState == 2)
    {
        //照片多于4张的时候
        
    }
    
    
}

















@end
