//
//  classExerciseView.m
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "classExerciseView.h"
#import "classExerciseCell.h"
#import "exerciseDetailView.h"
#import "writeExerciseView.h"

#define widthScale SCREEN_WIDTH/320

@interface classExerciseView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray *exerciseArray;//活动数组
@property (nonatomic,strong)UITableView *exerciseTableView;//活动列表

@end

@implementation classExerciseView
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
    self.navigationItem.title = @"班级活动";
    self.view.backgroundColor = [UIColor colorWithRed:227/255.0 green:243/255.0 blue:253/255.0 alpha:1.0];
    //如果用户是教师
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"plusAdd@2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] style:UIBarButtonItemStyleDone target:self action:@selector(writeClassExercise)];
    [self.view addSubview:self.exerciseTableView];
    // Do any additional setup after loading the view.
}
//编辑活动
- (void)writeClassExercise{
    writeExerciseView *writeView = [[writeExerciseView alloc]init];
    [self.navigationController pushViewController:writeView animated:YES];
}
- (UITableView*)exerciseTableView{
    if (_exerciseTableView == nil) {
        _exerciseTableView = [[UITableView alloc]initWithFrame:CGRectMake(10*widthScale, 5*widthScale, SCREEN_WIDTH-20*widthScale, SCREEN_HEIGHT-10*widthScale) style:UITableViewStylePlain];
        _exerciseTableView.backgroundColor = [UIColor colorWithRed:227/255.0 green:243/255.0 blue:253/255.0 alpha:1.0];
        _exerciseTableView.delegate = self;
        _exerciseTableView.dataSource = self;
        //隐藏分割线
        _exerciseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registcClassNotifyCell];
    }
    return _exerciseTableView;
}
- (void)registcClassNotifyCell{
    UINib *nib = [UINib nibWithNibName:@"classExerciseCell" bundle:nil];
    [_exerciseTableView registerNib:nib forCellReuseIdentifier:@"cellId"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    classExerciseCell *exerciseCell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    exerciseCell.selectionStyle = UITableViewCellSelectionStyleNone;
    [exerciseCell updateExerciseViewWithModel:nil];
    
    return exerciseCell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 188*widthScale;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    exerciseDetailView *detailView = [[exerciseDetailView alloc]init];
    [self.navigationController pushViewController:detailView animated:YES];
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
