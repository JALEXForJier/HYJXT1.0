//
//  Friends.m
//  hlJXT
//
//  Created by Jier on 16/3/22.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "Friends.h"
#import "ClassCircle.h"
#import "classExerciseView.h"
#import "connectTeacler.h"
@interface Friends ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *mytableview;
@end

@implementation Friends

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=MainColor;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title=@"发现";
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    else
    {
        return 4;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 60;
    }else
    {
        return 45;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    if (indexPath.section==0) {
        cell.textLabel.text=@"班级圈";
        cell.imageView.image=[UIImage imageNamed:@"icon_circle@2x.png"];
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            cell.textLabel.text=@"班级活动";
            cell.imageView.image=[UIImage imageNamed:@"icon_class_activity@2x.png"];
        }
        if (indexPath.row==1) {
            cell.textLabel.text=@"家长委员会";
            cell.imageView.image=[UIImage imageNamed:@"icon_parents@2x.png"];
        }
        if (indexPath.row==2) {
            cell.textLabel.text=@"我的班级";
            cell.imageView.image=[UIImage imageNamed:@"icon_class@2x.png"];
        }
        if (indexPath.row==3) {
            cell.textLabel.text=@"联系老师";
            cell.imageView.image=[UIImage imageNamed:@"icon_contact_teacher@2x.png"];
        }
        
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.textColor=[UIColor grayColor];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        //跳转至班级圈页面
        ClassCircle *classC=[[ClassCircle alloc]init];
        [self.navigationController pushViewController:classC animated:YES];
    }
    else  {
        if (indexPath.row==0) {
            //跳转至班级活动页面
            classExerciseView *classExercise = [[classExerciseView alloc]init];
            [self.navigationController pushViewController:classExercise animated:YES];
            
        }
        if (indexPath.row==1) {
            //跳转至家长委员会页面
        }
        if (indexPath.row==2) {
            //跳转至我的班级页面
        }
        if (indexPath.row==3) {
            //跳转至联系老师页面
            connectTeacler *connect = [[connectTeacler alloc]init];
            [self.navigationController pushViewController:connect animated:YES];
        }
    }
}











@end
