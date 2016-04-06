//
//  TeacherListView.m
//  咨询Demo
//
//  Created by admin on 16/3/23.
//  Copyright © 2016年 zhuxianhong. All rights reserved.
//

#import "TeacherListView.h"
#import "DrooDownChooseDelegate.h"
#import "DorpDownListView.h"
#import "TeacherDetailView.h"

@interface TeacherListView ()<DrooDownChooseDataSourse,DrooDownChooseDelegate,UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchControllerDelegate,UISearchBarDelegate>
@property (nonatomic,strong)NSMutableArray *dataSourse;
@property (nonatomic,strong)UITableView *teacherTableView;
@property (nonatomic,strong)NSMutableArray *teacherArray;
@property (nonatomic,strong)UIButton *selectButton;
@property (nonatomic,strong)UISearchController *teacherSearchController;
@property (nonatomic,strong)NSMutableArray *searchTeacherArray;
@end

@implementation TeacherListView
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
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.navigationItem.title = @"教师列表";
    [self initData];
    [self addTableView];
    [self setDropListView];
//    [self addselectButtonWithView];
    [self addsearchBar];
    // Do any additional setup after loading the view from its nib.
}

//初始化数据
-(void)initData{
    self.searchTeacherArray = [[NSMutableArray alloc]init];
    NSArray *gradeArray = @[@"请选择年级",@"高一",@"高二",@"高三"];
    NSArray *sectionArray = @[@"请选择教研组",@"语文",@"化学",@"物理"];
    self.teacherArray = [[NSMutableArray alloc]initWithArray:sectionArray];
    self.dataSourse = [[NSMutableArray alloc]initWithObjects:gradeArray,sectionArray, nil];
}
- (void)addsearchBar{
    self.teacherSearchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.teacherSearchController.searchResultsUpdater = self;
    self.teacherSearchController.delegate = self;
    
    //搜索时背景色变暗
    self.teacherSearchController.dimsBackgroundDuringPresentation = YES;
    [self.teacherSearchController.searchBar setShowsCancelButton:NO];
    //搜索时背景变模糊
    self.teacherSearchController.obscuresBackgroundDuringPresentation = YES;
    //隐藏导航栏
    self.teacherSearchController.hidesNavigationBarDuringPresentation = NO;
    [self.teacherSearchController.searchBar sizeToFit];
    self.teacherSearchController.searchBar.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.teacherSearchController.searchBar.placeholder = @"搜索";
    self.teacherTableView.tableHeaderView = self.teacherSearchController.searchBar;
    
}
//添加显示教师的tableView
- (void)addTableView{
    CGFloat widthScale = SCREEN_WIDTH/320;
    CGFloat heightScale = SCREEN_HEIGHT/568;
    self.teacherTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 51*widthScale, 320*heightScale, 568*heightScale) style:UITableViewStylePlain];
    self.teacherTableView.delegate = self;
    self.teacherTableView.dataSource = self;
    self.teacherTableView.bounces = NO;
    //隐藏cell之间的分割线
    self.teacherTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.teacherTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:self.teacherTableView];
}
//添加筛选框
- (void)setDropListView{
    CGFloat widthScale = SCREEN_WIDTH/320;
    CGFloat heightScale = SCREEN_HEIGHT/568;
    
    DorpDownListView *dropList = [[DorpDownListView alloc]initAndWithFrame:CGRectMake(5*widthScale, 5*widthScale, 310*widthScale, 40*heightScale) WithState:NO dataSource:self delegate:self];
    dropList.mSuperView = self.view;
    [self.view addSubview:dropList];
    
}
#pragma mark DrooDownChooseDataSourse,DrooDownChooseDelegate
- (NSInteger)numberOfSections{
    return self.dataSourse.count;
}
- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return [self.dataSourse[section] count];
}
- (NSString *)titleInSection:(NSInteger)section index:(NSInteger)index{
    return self.dataSourse[section][index];
}
- (NSInteger)defaultShowSection:(NSInteger)section{
    return 0;
}
- (void)chooseThatSection:(NSInteger)section index:(NSInteger)index{
    NSLog(@"选择了第几行:%ld 第几列:%ld",section,index);
}
#pragma mark UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.teacherSearchController.active) {
        return [self.searchTeacherArray count];
    }else{
        return self.teacherArray.count;
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID=@"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]init];
    }
/*
 设置cell样式
 UITableViewCellAccessoryNone;//cell没有任何的样式
 UITableViewCellAccessoryDisclosureIndicator;//cell的右边有一个小箭头，距离右边有十几像素；
 UITableViewCellAccessoryDetailDisclosureButton;//cell右边有一个蓝色的圆形button；
  UITableViewCellAccessoryCheckmark;//cell右边的形状是对号；
 */
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = @"习大大";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self setHidesBottomBarWhenPushed:YES];
    TeacherDetailView *teacherDetail = [[TeacherDetailView alloc] init];
    [self.navigationController pushViewController:teacherDetail animated:YES];
    
}
#pragma mark UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
#pragma need 搜索请求网络数据刷新数据
    
//    NSString *tearchString = self.teacherSearchController.searchBar.text;
//    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"(SELE CONTAIN[c]%@)",tearchString];
//    if (self.searchTeacherArray != nil) {
//        [self.searchTeacherArray removeAllObjects];
//    }
//    self.searchTeacherArray = [NSMutableArray arrayWithArray:[[self.teacherArray filteredArrayUsingPredicate:searchPredicate] mutableCopy]];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.teacherTableView reloadData];
//    }) ;
}

#pragma 暂时无用
//- (void)searchBarTextDidBeginEditing:(UISearchBar *)hsearchBar
//{
//    self.teacherSearchController.searchBar.showsCancelButton = YES;
//    for(id cc in [self.teacherSearchController.searchBar subviews])
//    {
//        if([cc isKindOfClass:[UIButton class]])
//        {
//            UIButton *btn = (UIButton *)cc;
//            [btn setTitle:@"取消" forState:UIControlStateNormal];
//        }
//    }
//}
//-(void)willPresentSearchController:(UISearchController *)searchController{
//    self.teacherSearchController.searchBar.showsCancelButton = YES;
//    for(id cc in [self.teacherSearchController.searchBar subviews])
//    {
//        if([cc isKindOfClass:[UIButton class]])
//        {
//            UIButton *btn = (UIButton *)cc;
//            [btn setTitle:@"取消" forState:UIControlStateNormal];
//        }
//    }
//
//}
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
