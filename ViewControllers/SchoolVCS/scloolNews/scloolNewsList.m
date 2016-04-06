//
//  scloolNewsList.m
//  hlJXT
//
//  Created by admin on 16/3/25.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "scloolNewsList.h"
#import "newListCell.h"

#define widthScale SCREEN_WIDTH/320

@interface scloolNewsList ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *scloolNewsTableView;
@property (nonatomic,strong)NSMutableArray *newsDataSourse;

@end

@implementation scloolNewsList
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
    
    self.navigationItem.title = @"新闻动态";
    self.view.backgroundColor = [UIColor whiteColor];
    self.newsDataSourse = [[NSMutableArray alloc]init];
    [self addTableView];
    // Do any additional setup after loading the view from its nib.
}
- (void)addTableView{
//    self.scloolNewsTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.scloolNewsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-55) style:UITableViewStylePlain];
    
    self.scloolNewsTableView.delegate = self;
    self.scloolNewsTableView.dataSource = self;
    self.scloolNewsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scloolNewsTableView registerClass:[newListCell class] forCellReuseIdentifier:@"xxx"];

    [self.view addSubview:self.scloolNewsTableView];
  
}

#pragma mark UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    newListCell *newCell;
    if (newCell == nil) {
        newCell = [[newListCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 96*widthScale)];
        newCell = [tableView dequeueReusableCellWithIdentifier:@"xxx"];
    }
    
    [newCell adjustCellwithModel:nil];
    return newCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"ddddd");
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 82*widthScale;
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
