//
//  headMasterMailDetail.m
//  hlJXT
//
//  Created by admin on 16/3/31.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "headMasterMailDetail.h"

#define widthScale SCREEN_WIDTH/320

@interface headMasterMailDetail ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *mailDetailScrollView;

@end

@implementation headMasterMailDetail
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
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mailDetailScrollView];
    // Do any additional setup after loading the view.
}
- (UIScrollView *)mailDetailScrollView{
    if (_mailDetailScrollView == nil) {
        _mailDetailScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _mailDetailScrollView.delegate = self;
        [self addForeLabel];
        _mailDetailScrollView.contentSize = CGSizeMake(320*widthScale, CGRectGetMaxY(self.mailContent.frame));
        
    }
    return _mailDetailScrollView;
}
- (void)addForeLabel{
    CGSize size = CGSizeMake(320*widthScale, CGFLOAT_MAX);
    self.titleTitle = [[UILabel alloc]initWithFrame:CGRectMake(10*widthScale, 10*widthScale, 50*widthScale, 30*widthScale)];
    self.titleTitle.text = @"标题:";
    [self.mailDetailScrollView addSubview:self.titleTitle];
    self.mailTitle = [[UILabel alloc]init];
     self.mailTitle.font = [UIFont systemFontOfSize:15];
     self.mailTitle.text = @"案发地方发送方发送方式发\n送阿斯顿发发生发的是";
    self.mailTitle.numberOfLines = 0;
    self.mailTitle.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize briefSize = [self.mailTitle.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    CGRect rect = self.mailTitle.frame;
    rect.size.height = briefSize.height;
    self.mailTitle.frame = CGRectMake(61*widthScale, 10*widthScale, 249*widthScale, (rect.size.height+10)*widthScale);
    [self.mailDetailScrollView addSubview:self.mailTitle];
    
    CGFloat titleFloat ;
    if ((rect.size.height+10)>=30) {
        titleFloat = rect.size.height+10;
    }else{
        titleFloat = 30;
    }
    UIImageView *lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(10*widthScale, (titleFloat+10)*widthScale, SCREEN_WIDTH, 2*widthScale)];
    lineImage.image = [UIImage imageNamed:@"img_hline_trans_nav"];
    [self.mailDetailScrollView addSubview:lineImage];
    
    CGFloat lineFloat = titleFloat+10;
    self.content = [[UILabel alloc]initWithFrame:CGRectMake(10*widthScale, (lineFloat+10)*widthScale, 50*widthScale, 25*widthScale)];
    self.content.text = @"内容:";
    [self.mailDetailScrollView addSubview:self.content];
    
    self.mailContent = [[UILabel alloc]init];
    self.mailContent.font = [UIFont systemFontOfSize:14];
    self.mailContent.text = @"       爱的发发发啥事阿萨德安抚大发发沙发沙发沙发沙发上发放阿斯顿发的说法是发生发发发发送阿斯顿发发发发发发生法法师法师法师法啥事大事发生发撒算法是飞洒啊发发发阿大沙发沙发沙发是飞洒发生发生时大沙发沙发沙发沙发沙发沙发上发生大法师法师法爱的发发发啥事阿萨德安抚大发发沙发沙发沙发沙发上发放阿斯顿发的说法是发生发发发发送阿斯顿发发发发发发生法法师法师法师法啥事大事发生发撒算法是飞洒啊发发发阿大沙发沙发沙发是飞洒发生发生时大沙发沙发沙发沙发沙发沙发上发生大法师法师法heightScale爱的发发发啥事阿萨德安抚大发发沙发沙发沙发沙发上发放阿斯顿发的说法是发生发发发发送阿斯顿发发发发发发生法法师法师法师法啥事大事发生发撒算法是飞洒啊发发发阿大沙发沙发沙发是飞洒发生发生时大沙发沙发沙发沙发沙发沙发上发生大法师法师法爱的发发发啥事阿萨德安抚大发发沙发沙发沙发沙发上发放阿斯顿发的说法是发生发发发发送阿斯顿发发发发发发生法法师法师法师法啥事大事发生发撒算法是飞洒啊发发发阿大沙发沙发沙发是飞洒发生发生时大沙发沙发沙发沙发沙发沙发上发生大法师法师法";
    
    self.mailContent.numberOfLines = 0;
    self.mailContent.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize mailbriefSize = [self.mailContent.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    CGRect mailrect = self.mailContent.frame;
    mailrect.size.height = mailbriefSize.height;
    self.mailContent.frame = CGRectMake(10*widthScale, (lineFloat +10)*widthScale, 300*widthScale, (mailrect.size.height+30)*widthScale);
    [self.mailDetailScrollView addSubview:self.mailContent];
    
}
-(void)resetContent{
        
        NSMutableAttributedString *attributedString = [[ NSMutableAttributedString alloc ] initWithString : self.mailContent.text ];
        
        NSMutableParagraphStyle *paragraphStyle = [[ NSMutableParagraphStyle alloc ] init ];
        
        paragraphStyle. alignment = NSTextAlignmentLeft ;
        
        paragraphStyle. maximumLineHeight = 60 ;  //最大的行高
        
        paragraphStyle. lineSpacing = 5 ;  //行自定义行高度
        
        [paragraphStyle setFirstLineHeadIndent: 5]; //首行缩进 根据用户昵称宽度在加5个像素
        
        [attributedString addAttribute : NSParagraphStyleAttributeName value :paragraphStyle range : NSMakeRange ( 0 , [ self.mailContent.text length ])];
        
        self.mailContent . attributedText = attributedString;
        
        [ self.mailContent sizeToFit];
    
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
