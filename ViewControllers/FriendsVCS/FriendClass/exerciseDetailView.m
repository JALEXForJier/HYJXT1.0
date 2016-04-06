//
//  exerciseDetailView.m
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "exerciseDetailView.h"


#define widthScale SCREEN_WIDTH/320
@interface exerciseDetailView ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *exerciseDetailScroll;//详情界面
@property (nonatomic,strong)UIImageView *detailImageView;
@property (nonatomic,strong)UILabel *detailTitle;//活动名称
@property (nonatomic,strong)UILabel *detailContent;//活动内容

@end

@implementation exerciseDetailView
//push出界面是底部栏隐藏
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.hidden=NO;
}
//退出界面是底部栏隐藏
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:227/255.0 green:243/255.0 blue:253/255.0 alpha:1.0];
    self.navigationItem.title = @"详情";
    [self.view addSubview:self.exerciseDetailScroll];
    [self addExerciseDetailImage];
    
    // Do any additional setup after loading the view from its nib.
}
- (UIScrollView *)exerciseDetailScroll{
    if (_exerciseDetailScroll == nil) {
        _exerciseDetailScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _exerciseDetailScroll.delegate = self;
        
    }
    return _exerciseDetailScroll;
}

- (void)addExerciseDetailImage{
    self.detailImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20*widthScale, 20*widthScale, 280*widthScale, 200*widthScale)];
    self.detailImageView.image = [UIImage imageNamed:@"backp1.png"];
    [self.exerciseDetailScroll addSubview:self.detailImageView];
    [self addExerciseDetailTitle];
    
    
}
- (void)addExerciseDetailTitle{
    self.detailTitle = [[UILabel alloc]init];
    CGSize size = CGSizeMake(280, CGFLOAT_MAX);
    //label文本行数设为0即为不限行数
    self.detailTitle.numberOfLines = 0;
    //label内容过长时自动换行
    self.detailTitle.lineBreakMode = NSLineBreakByCharWrapping;
    self.detailTitle.font = [UIFont systemFontOfSize:15];
    self.detailTitle.text = @"dddddd";
    //根据内容多少计算行高
    CGSize requireSize = [self.detailTitle.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    CGRect rect = self.detailTitle.frame;
    rect.size.height = requireSize.height;
    self.detailTitle.frame = CGRectMake(20*widthScale, 232*widthScale, 280*widthScale, rect.size.height*widthScale);
    [self.exerciseDetailScroll addSubview:self.detailTitle];
    
    CGFloat contentFloat = 232+requireSize.height;
    [self addexercisedETAILContent:contentFloat];
}
- (void)addexercisedETAILContent:(CGFloat)detailTitleHeight{
    self.detailContent = [[UILabel alloc]init];
    CGSize size = CGSizeMake(280, CGFLOAT_MAX);
    //label文本行数设为0即为不限行数
    self.detailContent.numberOfLines = 0;
    //label内容过长时自动换行
    self.detailContent.lineBreakMode = NSLineBreakByCharWrapping;
    self.detailContent.font = [UIFont systemFontOfSize:13];
    self.detailContent.text = @"dddddddddddd埃文斯的答复答复的分公司感ddd埃文斯的答复答\n复的分公司感受到故\n事梗概dddd埃文斯的答复答复的分公司感受到故事梗概d受到故事梗概d";
    //根据内容多少计算行高
    CGSize requireSize = [self.detailContent.text sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    CGRect rect = self.detailContent.frame;
    rect.size.height = requireSize.height;
    self.detailContent.frame = CGRectMake(20*widthScale, detailTitleHeight*widthScale, 280*widthScale, rect.size.height*widthScale);
    
    [self.exerciseDetailScroll addSubview:self.detailContent];
    
    self.exerciseDetailScroll.contentSize = CGSizeMake(320, (detailTitleHeight+rect.size.height)*widthScale);
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
