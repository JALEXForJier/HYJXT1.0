//
//  TeacherDetailView.m
//  咨询Demo
//
//  Created by admin on 16/3/24.
//  Copyright © 2016年 zhuxianhong. All rights reserved.
//

#import "TeacherDetailView.h"
#import "teacherDetailCommandCell.h"
#define widthScale SCREEN_WIDTH/320


@interface TeacherDetailView ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UIImageView *teacherHeadImageView;
@property (strong, nonatomic) UILabel *teacherName;
@property (strong, nonatomic) UILabel *TeacherAge;
@property (strong, nonatomic) UILabel *teacherPhoneNum;
@property (strong, nonatomic) UILabel *teacherRecord;
@property (strong, nonatomic) UITableView *teacherCommed;
@property (strong, nonatomic) UILabel *name;
@property (strong, nonatomic) UILabel *age;
@property (strong, nonatomic) UILabel *phoneNumber;
@property (strong, nonatomic) UILabel *record;
@property (strong, nonatomic) UILabel *command;
@property (nonatomic,strong)  NSMutableArray *teacherCommandArray;
@property (strong, nonatomic) UIScrollView *teacherDetailScroll;
@property (strong, nonatomic) UILabel *group;
@property (strong, nonatomic) UILabel *teacherGroup;
@property (nonatomic,strong)UIImageView *lineImage;

@end

@implementation TeacherDetailView
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
    self.navigationItem.title = @"教师信息";
     self.teacherCommandArray = [[NSMutableArray alloc]init];
    _teacherDetailScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320*widthScale, 568*widthScale)];
    self.view.backgroundColor=[UIColor whiteColor];
    _teacherDetailScroll.delegate = self;
   
    [self.view addSubview:self.teacherDetailScroll];
    [self addBasisTeacherInformation];
    CGFloat scrollViewH = CGRectGetMaxY(self.teacherCommed.frame);
    _teacherDetailScroll.contentSize = CGSizeMake(320*widthScale, scrollViewH);
}

//加载教师个人基本信息
- (void)addBasisTeacherInformation{
   
    self.teacherHeadImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5*widthScale, 10*widthScale, 90*widthScale, 93*widthScale)];
    self.teacherName = [[UILabel alloc]initWithFrame:CGRectMake(164*widthScale, 10*widthScale, 107*widthScale, 20*widthScale)];
    self.TeacherAge = [[UILabel alloc]initWithFrame:CGRectMake(164*widthScale, 31*widthScale, 107*widthScale, 20*widthScale)];
    self.teacherGroup = [[UILabel alloc]initWithFrame:CGRectMake(164*widthScale, 52*widthScale, 110*widthScale, 20*widthScale)];
    self.teacherPhoneNum = [[UILabel alloc]initWithFrame:CGRectMake(164*widthScale, 73*widthScale, 107*widthScale, 20*widthScale)];
    self.lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 106*widthScale, SCREEN_WIDTH, 1*widthScale)];
    self.lineImage.image = [UIImage imageNamed:@"img_hline_trans_nav.png"];
    [self.teacherHeadImageView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"teacherHead.png"]];
    self.teacherName.text = @"习大大";
    self.TeacherAge.text = @"123";
    self.teacherPhoneNum.text = @"12334456789";
    self.teacherGroup.text = @"中纪委";
    [self.teacherPhoneNum adjustsFontSizeToFitWidth];
    [self.teacherGroup adjustsFontSizeToFitWidth];
   
    
    [self.teacherDetailScroll addSubview:self.teacherHeadImageView];
    [self.teacherDetailScroll addSubview:self.teacherName];
    [self.teacherDetailScroll addSubview:self.TeacherAge];
    [self.teacherDetailScroll addSubview:self.teacherGroup];
    [self.teacherDetailScroll addSubview:self.teacherPhoneNum];
    [self.teacherDetailScroll addSubview:self.lineImage];

    
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(121*widthScale, 10*widthScale, 42*widthScale, 21*widthScale)];
    self.group = [[UILabel alloc]initWithFrame:CGRectMake(121*widthScale, 52*widthScale, 42*widthScale, 21*widthScale)];
    self.age = [[UILabel alloc]initWithFrame:CGRectMake(121*widthScale, 31*widthScale, 42*widthScale, 21*widthScale)];
     self.phoneNumber = [[UILabel alloc]initWithFrame:CGRectMake(121*widthScale, 73*widthScale, 42*widthScale, 21*widthScale)];
    
     self.record = [[UILabel alloc]initWithFrame:CGRectMake(17*widthScale, 111*widthScale, 42*widthScale, 21*widthScale)];
    self.name.text = @"姓名:";
    self.age.text = @"年龄:";
    self.phoneNumber.text = @"手机:";
    self.record.text = @"资历:";
    self.group.text = @"组别:";
//     [self.name adjustsFontSizeToFitWidth];
//    [self.age adjustsFontSizeToFitWidth];
//    [self.group adjustsFontSizeToFitWidth];
    [self.phoneNumber adjustsFontSizeToFitWidth];
    
    [self.teacherDetailScroll addSubview:self.name];
    [self.teacherDetailScroll addSubview:self.phoneNumber];
    [self.teacherDetailScroll addSubview:self.age];
    [self.teacherDetailScroll addSubview:self.record];
    [self.teacherDetailScroll addSubview:self.group];
    self.teacherRecord = [[UILabel alloc]init];
    //根据内容多少计算行高
    self.teacherRecord.font = [UIFont systemFontOfSize:14];
    self.teacherRecord.text = @"所得税法嘎大大大叔嘎嘎嘎发嘎嘎嘎发嘎嘎个嘎嘎大法官方式解决个省份地方三顿饭啊啊哈哈哈阿斯蒂芬嘎所得税法嘎大大大叔嘎嘎嘎发嘎嘎嘎发嘎嘎\n个嘎嘎大法官方式解决个省份地方三顿饭啊啊哈哈哈阿斯蒂芬嘎所得税法嘎大大大叔嘎嘎嘎发嘎嘎嘎发嘎嘎个嘎嘎大法官方式解决个省份地方三顿饭啊啊哈哈哈阿斯蒂芬嘎所得税法嘎大大大叔嘎嘎嘎发嘎嘎嘎发嘎嘎个嘎嘎大法官方式解决个省份地方三顿饭啊啊哈哈哈阿斯蒂芬嘎所得税法嘎大大大叔嘎嘎嘎发嘎嘎嘎发嘎嘎\n个嘎嘎大法官方式解决个省份地方三顿饭啊啊哈哈哈阿斯蒂芬嘎所得税法嘎大大大叔嘎嘎嘎发嘎嘎嘎发嘎嘎个嘎嘎大法官方式解决个省份地方三顿饭啊啊哈哈哈阿斯蒂芬嘎";
    CGSize size = CGSizeMake(320*widthScale, CGFLOAT_MAX);
    //label文本行数设为0即为不限行数
    self.teacherRecord.numberOfLines = 0;
    //label内容过长时自动换行
    self.teacherRecord.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize requireSize = [self.teacherRecord.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    CGRect rect = self.teacherRecord.frame;
    rect.size.height = requireSize.height;
    self.teacherRecord.frame = CGRectMake(20*widthScale, 140*widthScale, 285*widthScale, rect.size.height*widthScale);
    CGFloat recordFloat = requireSize.height+145;
    self.command = [[UILabel alloc]initWithFrame:CGRectMake(17*widthScale, recordFloat*widthScale, 42*widthScale, 17*widthScale)];
    
    self.teacherCommed = [[UITableView alloc]initWithFrame:CGRectMake(20*widthScale, (recordFloat+18)*widthScale, 290*widthScale, 14*44*widthScale) style:UITableViewStylePlain];
    self.teacherCommed.delegate = self;
    self.teacherCommed.dataSource = self;
    self.command.text = @"奖项:";
    self.teacherCommed.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    self.teacherCommed.separatorStyle = UITableViewCellSeparatorStyleNone;
    //tableView滑动不可超出边界
    //    self.teacherCommed.bounces = NO;
    UINib *nib = [UINib nibWithNibName:@"teacherDetailCommandCell" bundle:nil];
    [self.teacherCommed registerNib:nib forCellReuseIdentifier:@"cellId"];
   

    [self.teacherDetailScroll addSubview:self.teacherRecord];
    [self.teacherDetailScroll addSubview:self.command];
    [self.teacherDetailScroll addSubview:self.teacherCommed];
  
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 14;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    teacherDetailCommandCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
    [cell updateDetailWithModel:nil];
   
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    teacherDetailCommandCell *teacher = (teacherDetailCommandCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return teacher.frame.size.height;
    
}
@end
