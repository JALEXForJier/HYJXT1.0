//
//  scloolPublicNotify.m
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "scloolPublicNotify.h"
#import "notifyCell.h"
#import "notifyDetail.h"


#define widthScale SCREEN_WIDTH/320
@interface scloolPublicNotify ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *publicNotify;
@property (nonatomic,strong)NSMutableArray *notifyMutableArray;//通知数组


@end

@implementation scloolPublicNotify
//push出界面是底部栏隐藏
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.hidden=NO;
}
//退出界面是底部栏显示
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"学校公告";
    [self.view addSubview:self.publicNotify];
    // Do any additional setup after loading the view from its nib.
}
- (UITableView *)publicNotify{
    if (_publicNotify == nil) {
        _publicNotify = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-55) style:UITableViewStylePlain];
        _publicNotify.delegate = self;
        _publicNotify.dataSource = self;
        [self registCellWithNib];
    }
    return _publicNotify;
}
- (void)registCellWithNib{
    UINib *nib = [UINib nibWithNibName:@"notifyCell" bundle:nil];
    [_publicNotify registerNib:nib forCellReuseIdentifier:@"cellId"];
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
