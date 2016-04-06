//
//  Message.m
//  hlJXT
//
//  Created by Jier on 16/3/21.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "Message.h"
#import "scloolPublicNotify.h"
#import "teacherNotify.h"
#import "classNotifyView.h"
#import "connectTeacler.h"
#import "StudentAskingForLeave.h"
#import "MessageGrobleNavigation.h"
#import "ChatViewController.h"                         //会话界面依赖库
#import "messageCell.h"
#import "EaseConversationListViewController.h"         //会话列表依赖库

@interface Message ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *mytableview;
@property (nonatomic) int currentState;   //当前界面的状态 默认0是通知 1是会话
@end

@implementation Message

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=MainColor;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    self.navigationItem.title = @"消息";
    self.navigationController.navigationBar.translucent=NO;
   
    
    _mytableview.delegate=self;
    _mytableview.dataSource=self;
    _mytableview.scrollEnabled=NO;
     UINib *nib = [UINib nibWithNibName:@"messageCell" bundle:nil];
    [_mytableview registerNib:nib forCellReuseIdentifier:@"cellId"];
    [_segmentedControl addTarget:self action:@selector(changeView) forControlEvents:UIControlEventValueChanged];
}


-(void)changeView
{
    if (_segmentedControl.selectedSegmentIndex == 0) {
        _currentState = 0;
        [_mytableview reloadData];
    }
    else if(_segmentedControl.selectedSegmentIndex == 1)
    {
        _currentState = 1;
        [_mytableview reloadData];
    }

}


#pragma mark-UITableview delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.currentState == 0){
        return 4;
    }
    else if(self.currentState == 1)
    {
        return 2;
    }
    else
    {
        return 0;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    messageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    
    
    
    if (self.currentState == 0) {
        cell.number.layer.borderWidth = 1.5;
        cell.number.layer.cornerRadius = 5;
        cell.number.layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);
        
        if (indexPath.row == 0) {
            cell.scloolPublic.text=@"学校公告";
            cell.scloolBulletin.text = @"SCHOOL BULLETIN";
            cell.number.text = @"23";
        }
        if (indexPath.row == 1) {
            cell.scloolPublic.text=@"教师通知";
            cell.scloolBulletin.text = @"TEACHER NOTICE";
            cell.number.text = @"23";
        }
        if (indexPath.row == 2) {
            cell.scloolPublic.text=@"班级通知";
            cell.scloolBulletin.text = @"CLASS  NOTICE";
            cell.number.text = @"23";
        }
        if (indexPath.row == 3) {
            cell.scloolPublic.text=@"学生请假";
            cell.scloolBulletin.text = @"LEAVES OF ABSENCE";
            cell.number.text = @"23";
        }
        
    }
    
    if (self.currentState == 1) {
        cell.number.layer.borderWidth = 0;
        if (indexPath.row == 0) {
            cell.scloolPublic.text=@"消息列表";
            cell.scloolBulletin.text = nil;
            cell.number.text = nil;
        }
        else
        {
            cell.scloolPublic.text=@"最近联系人";
            cell.scloolBulletin.text = nil;
            cell.number.text = nil;
        }
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.currentState == 0) {
        if (indexPath.row == 0) {
           //跳转至学校公告页面
            scloolPublicNotify *scloolNotify = [[scloolPublicNotify alloc]init];
            [self.navigationController pushViewController:scloolNotify animated:YES];
        }
        if (indexPath.row == 1) {
//            跳转至班级通知页面
            classNotifyView *classNotify = [[classNotifyView alloc]init];
            [self.navigationController pushViewController:classNotify animated:YES];
        }
        if (indexPath.row == 2) {
           //跳转至教师通知页面
            teacherNotify *teacher = [[teacherNotify alloc]init];
            [self.navigationController pushViewController:teacher animated:YES];
        }
        if (indexPath.row == 3) {
            //跳转至学生请假页面
            StudentAskingForLeave *saf=[[StudentAskingForLeave alloc]init];
            [self.navigationController pushViewController:saf animated:YES];
        }
    }
    
    if (self.currentState == 1) {
        if (indexPath.row == 0) {
            //跳转至消息列表页面
            ChatViewController *chatVC=[[ChatViewController alloc]initWithConversationChatter:@"lq" conversationType:eConversationTypeChat];      //会话用户名
            chatVC.title=@"lq";    //会话标题
            
            MessageGrobleNavigation *nav = [[MessageGrobleNavigation alloc]initWithRootViewController:chatVC];
            [self presentViewController:nav animated:YES completion:nil];

        }
        else
        {
            EaseConversationListViewController *elvc = [[EaseConversationListViewController alloc]init];
            elvc.title = @"最近联系人";
            [self.navigationController pushViewController:elvc animated:YES];
            //跳转至会话列表页面
            
            
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 53*SCREEN_WIDTH/320;
}




@end
