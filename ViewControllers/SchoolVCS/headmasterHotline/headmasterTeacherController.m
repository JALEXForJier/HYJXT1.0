//
//  headmasterTeacherController.m
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "headmasterTeacherController.h"
#import "headmasterCell.h"
#import "studentsHotLine.h"
#import "headMasterMailDetail.h"

#define widthScale SCREEN_WIDTH/320

@interface headmasterTeacherController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *hotLineTableView;
@property (nonatomic,strong)NSMutableArray *hotLineArray;

@end

@implementation headmasterTeacherController
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
    
    self.hotLineArray = [[NSMutableArray alloc]init];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"plus@2x.png"] style:UIBarButtonItemStyleDone target:self action:@selector(studentsWriteHotLine)];
    self.navigationItem.title = @"校长信箱";
    [self.view addSubview:self.hotLineTableView];
    // Do any additional setup after loading the view from its nib.
}
- (void)studentsWriteHotLine{
    studentsHotLine *students = [[studentsHotLine alloc]init];
    [self.navigationController pushViewController:students animated:YES];
}

- (UITableView *)hotLineTableView{
    if (_hotLineTableView == nil) {
        _hotLineTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        self.hotLineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _hotLineTableView.delegate = self;
        _hotLineTableView.dataSource = self;
        [self registTableViewCell];
    }
    return _hotLineTableView;
}
- (void)registTableViewCell{
    UINib *nib = [UINib nibWithNibName:@"headmasterCell" bundle:nil];
    [_hotLineTableView registerNib:nib forCellReuseIdentifier:@"cellId"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    headmasterCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
     headCell.headMasterMailImageView.image = [UIImage imageNamed:@"icon_mail@2x.png"];
    [headCell updateHeadMasterMailListWithModel:nil];
    return headCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65*widthScale;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    headMasterMailDetail *detail = [[headMasterMailDetail alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
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
