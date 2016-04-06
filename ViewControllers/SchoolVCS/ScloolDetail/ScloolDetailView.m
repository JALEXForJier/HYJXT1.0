//
//  ScloolDetailView.m
//  hlJXT
//
//  Created by admin on 16/3/24.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "ScloolDetailView.h"
#import "TimeLineViewControl.h"
#import "scloolImageController.h"

#define widthScale SCREEN_WIDTH/320


@interface ScloolDetailView ()<UIScrollViewDelegate>
@property (strong, nonatomic) UIView *tableHead;//时间轴view
@property (strong, nonatomic) UIButton *scloolImageView;//学校首图
@property (strong, nonatomic) UILabel *scloolName;//学校名字
@property (strong, nonatomic) UILabel *scloolBrieflyinfomation;//历史发展
@property (strong, nonatomic)UILabel *scloolKnown;//学校介绍
@property (strong, nonatomic) UILabel *scloolDetailIntroduce;//学校详情
@property (strong, nonatomic) UILabel *scloolDevelop;//历史发展
@property (nonatomic,strong) UILabel *name;//名字
@property (strong, nonatomic) UIScrollView *detailView;//界面scrollView
@property (nonatomic,strong)NSMutableArray *developTimeArray;//历史发展时间轴时间
@property (nonatomic,strong)NSMutableArray *developincidentArray;//历史发展时间轴事件
@property (nonatomic,strong)NSMutableArray *scloolImageArray;//学校图片数组
@property (nonatomic,strong)UILabel *scloolImageNumber;//学校有几张图片

@end

@implementation ScloolDetailView
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.hidden=NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden=YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.scloolImageArray = [[NSMutableArray alloc]init];
    self.developincidentArray = [[NSMutableArray alloc]initWithObjects:@"sun",@"mon",@"tue",@"wed",@"thr",@"fri",@"sat", nil];
    self.developTimeArray     = [[NSMutableArray alloc]initWithObjects:@"state 1",@"state 2",@"state 3",@"state 4",@"very",@"state 6",@"state 7", nil];
    self.navigationItem.title = @"学校介绍";
    
    self.detailView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.detailView.delegate = self;
    [self.view addSubview:self.detailView];
    [self addScrollViewWithModel:nil];
    CGFloat scrollViewH = CGRectGetMaxY(self.tableHead.frame);
    self.detailView.contentSize = CGSizeMake(320*widthScale, scrollViewH);
    
    
    // Do any additional setup after loading the view from its nib.
}
//加载学校的图片
- (void)addImageArray{
    scloolImageController *sclool = [[scloolImageController alloc]init];
    sclool.navigationItem.title = self.scloolName.text;
    sclool.imageArray = [[NSMutableArray alloc]initWithArray:self.scloolImageArray];
    //    [sclool addScloolImages:self.scloolImageArray];
    [self.navigationController pushViewController:sclool animated:YES];
}
//调整各控件的位置大小
- (void)addScrollViewWithModel:(id)model{
    for (int image = 0; image < 4; image++) {
        UIImage *scloolImage = [UIImage imageNamed:[NSString stringWithFormat:@"backp%d.png",image]];
        [self.scloolImageArray addObject:scloolImage];
    }
    
    self.scloolImageView = [[UIButton alloc]initWithFrame:CGRectMake(8*widthScale, 10*widthScale, 120*widthScale, 116*widthScale)];
    [self.scloolImageView setBackgroundImage:[UIImage imageNamed:@"teacherHead.png"] forState:UIControlStateNormal];
    [self.scloolImageView addTarget:self action:@selector(addImageArray) forControlEvents:UIControlEventTouchDown];
    self.scloolImageNumber = [[UILabel alloc]initWithFrame:CGRectMake(40*widthScale, 90*widthScale, 60*widthScale, 20*widthScale)];
    self.scloolImageNumber.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    self.scloolImageNumber.textColor = [UIColor colorWithRed:0 green:0 blue:0.8 alpha:0.8];
    [self.scloolImageView addSubview:self.scloolImageNumber];
    self.scloolImageNumber.text = [NSString stringWithFormat:@"共%ld图",self.scloolImageArray.count];
    
    CGSize size = CGSizeMake(320*widthScale, CGFLOAT_MAX);
    self.scloolName = [[UILabel alloc]initWithFrame:CGRectMake(150*widthScale, 10*widthScale, 160*widthScale, 37*widthScale)];
    self.scloolName.text = @"浙江工业大学";
    self.scloolBrieflyinfomation = [[UILabel alloc]init];
    self.scloolBrieflyinfomation.font = [UIFont systemFontOfSize:12];
    self.scloolBrieflyinfomation.text = @"大大大大大哥哥哥哥哥是是是是是是是随时随时大大大大大哥哥哥哥哥是是是是是是是随时随时大大大大大哥哥哥哥哥是是是是是是是随时随时大大大大大";
    
    self.scloolBrieflyinfomation.numberOfLines = 0;
    self.scloolBrieflyinfomation.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize briefSize = [self.scloolBrieflyinfomation.text sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    CGRect rect = self.scloolBrieflyinfomation.frame;
    rect.size.height = briefSize.height;
    self.scloolBrieflyinfomation.frame = CGRectMake(140*widthScale, 45*widthScale, 160*widthScale, (rect.size.height+30)*widthScale);
    //计算简介lable的高度
    CGFloat nameBottom = briefSize.height+65;
    CGFloat scloolImage = 134;
    CGFloat knowTop;
    if (scloolImage >= nameBottom) {
        knowTop = scloolImage;
    }else{
        knowTop = nameBottom;
    }
    self.scloolKnown = [[UILabel alloc]initWithFrame:CGRectMake(8*widthScale, knowTop*widthScale, 81*widthScale, 30*widthScale)];
    self.scloolKnown.text = @"学校介绍";
    [self.detailView addSubview:self.scloolImageView];
    [self.detailView addSubview:self.scloolName];
    [self.detailView addSubview:self.scloolBrieflyinfomation];
    [self.detailView addSubview:self.scloolKnown];
    
    
    self.scloolDetailIntroduce = [[UILabel alloc]init];
    self.scloolDetailIntroduce.font = [UIFont systemFontOfSize:13];
    self.scloolDetailIntroduce.text = @"爱的发发发啥事阿萨德安抚大发发沙发沙发沙发沙发上发放阿斯顿发的说法是发生发发发发送阿斯顿发发发发发发生法法师法师法师法啥事大事发生发撒算法是飞洒啊发发发阿大沙发沙发沙发是飞洒发生发生时大沙发沙发沙发沙发沙发沙发上发生大法师法师法爱的发发发啥事阿萨德安抚大发发沙发沙发沙发沙发上发放阿斯顿发的说法是发生发发发发送阿斯顿发发发发发发生法法师法师法师法啥事大事发生发撒算法是飞洒啊发发发阿大沙发沙发沙发是飞洒发生发生时大沙发沙发沙发沙发沙发沙发上发生大法师法师法heightScale爱的发发发啥事阿萨德安抚大发发沙发沙发沙发沙发上发放阿斯顿发的说法是发生发发发发送阿斯顿发发发发发发生法法师法师法师法啥事大事发生发撒算法是飞洒啊发发发阿大沙发沙发沙发是飞洒发生发生时大沙发沙发沙发沙发沙发沙发上发生大法师法师法爱的发发发啥事阿萨德安抚大发发沙发沙发沙发沙发上发放阿斯顿发的说法是发生发发发发送阿斯顿发发发发发发生法法师法师法师法啥事大事发生发撒算法是飞洒啊发发发阿大沙发沙发沙发是飞洒发生发生时大沙发沙发沙发沙发沙发沙发上发生大法师法师法heightScale";
    self.scloolDetailIntroduce.numberOfLines = 0;
    self.scloolDetailIntroduce.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize detailSize = [self.scloolDetailIntroduce.text sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    CGRect detailRect = self.scloolDetailIntroduce.frame;
    detailRect.size.height = detailSize.height;
    self.scloolDetailIntroduce.frame = CGRectMake(13*widthScale, (knowTop +32)*widthScale, 297*widthScale, detailRect.size.height*widthScale);
    self.scloolDevelop = [[UILabel alloc]initWithFrame:CGRectMake(8*widthScale, (knowTop +35+detailRect.size.height)*widthScale, 81*widthScale, 30*widthScale)];
    self.scloolDevelop.text = @"历史发展";
    
    [self.detailView addSubview:self.scloolDetailIntroduce];
    [self.detailView addSubview:self.scloolDevelop];
    
    CGFloat timerLineFloat = knowTop +65+detailRect.size.height;
    [self addScloolDevelopWith:timerLineFloat];
    
    //    [self.scloolName setText:@""];
    //    [self.scloolKnown setText:@""];
    //    [self.scloolDevelop setText:@""];
    //    [self.scloolBrieflyinfomation setText:@""];
    //    [self.scloolDetailIntroduce setText:@""];
    //    self.scloolImageView.image = [UIImage imageNamed:@""];
    
    
}

- (void)addScloolDevelopWith:(CGFloat)developFloat{
    TimeLineViewControl *timeLine = [[TimeLineViewControl alloc]initWithTimeArray:self.developincidentArray andTimeDescriptionArray: self.developTimeArray andCurrentStatus:7 andFrame:CGRectMake(0, 0, 160*widthScale, 500)];
    self.tableHead = [[UIView alloc]initWithFrame:CGRectMake(40*widthScale, (developFloat+2)*widthScale, SCREEN_WIDTH*3/4, 500)];
    self.tableHead.hidden = NO;
    [self.tableHead addSubview:timeLine];
    [self.detailView addSubview:self.tableHead];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
