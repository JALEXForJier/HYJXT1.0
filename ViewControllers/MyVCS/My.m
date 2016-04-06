//
//  My.m
//  hlJXT
//
//  Created by Jier on 16/3/21.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "My.h"
#import "AskForLeaveList.h"
#import "MyGrade.h"
#import "recipelistView.h"

@interface My ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *mytableview;

@end
@implementation My

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:56/255.0 green:183/255.0 blue:238/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title=@"我的";
    self.navigationController.navigationBar.translucent=NO;
    [self addTableView];
}

-(void)addTableView
{
    _mytableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _mytableview.dataSource=self;
    _mytableview.delegate=self;
    _mytableview.scrollEnabled=NO;
    [self.view addSubview:_mytableview];
}







#pragma mark-TableView delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 64*SCREEN_WIDTH/320;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    if (indexPath.row==0) {
        cell.textLabel.text=@"我的作业";
        cell.imageView.image = [UIImage imageNamed:@"icon_homework@2x.png"];
    }
    if (indexPath.row==1) {
        cell.textLabel.text=@"我的成绩";
        cell.imageView.image = [UIImage imageNamed:@"icon_score@2x.png"];
    }
    if (indexPath.row==2) {
        cell.textLabel.text=@"每周食谱";
        cell.imageView.image = [UIImage imageNamed:@"icon_recipes@2x.png"];
        
    }
    if (indexPath.row==3) {
        cell.textLabel.text=@"我要请假";
        cell.imageView.image = [UIImage imageNamed:@"icon_absence@2x.png"];
    }
    if (indexPath.row==4) {
        cell.textLabel.text=@"我的基本信息";
        cell.imageView.image = [UIImage imageNamed:@"icon_personal_files@2x.png"];
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.textColor=[UIColor grayColor];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row==0) {
        //跳转至我的作业页面
    }
    if (indexPath.row==1) {
        //跳转至我的成绩页面  学生端
        MyGrade *mygrade=[[MyGrade alloc]init];
        [self.navigationController pushViewController:mygrade animated:YES];
    }
    if (indexPath.row==2) {
        //跳转至每周食谱页面
        recipelistView *recipeView = [[recipelistView alloc]init];
        [self.navigationController pushViewController:recipeView animated:YES];
    }
    if (indexPath.row==3) {
        AskForLeaveList *askforleave=[[AskForLeaveList alloc]init];
        [self.navigationController pushViewController:askforleave animated:YES];
        
        //跳转至我要请假页面
    }
    if (indexPath.row==4) {
        //跳转至我的基本信息页面
    }
}



@end
