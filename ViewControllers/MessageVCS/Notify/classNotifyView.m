//
//  classNotifyView.m
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "classNotifyView.h"
#import "notifyCell.h"
#import "notifyDetail.h"

#define widthScale SCREEN_WIDTH/320

@interface classNotifyView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *classNotifyArray;//班级通知信息数组
@property (nonatomic,strong)UITableView *classTableView;

@end

@implementation classNotifyView
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
    self.navigationItem.title = @"班级通知";
    [self.view addSubview:self.classTableView];
    // Do any additional setup after loading the view.
}
- (UITableView *)classTableView{
    if (_classTableView == nil) {
        _classTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT- 55) style:UITableViewStylePlain];
        _classTableView.delegate = self;
        _classTableView.dataSource = self;
        [self registcClassNotifyCell];
        
    }
    return _classTableView;
}
- (void)registcClassNotifyCell{
    UINib *nib = [UINib nibWithNibName:@"notifyCell" bundle:nil];
    [_classTableView registerNib:nib forCellReuseIdentifier:@"cellId"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    notifyCell *notify = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    [notify updateCellWithModel:nil];
    return notify;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90*widthScale;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    notifyDetail *detail = [[notifyDetail alloc]init];
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
