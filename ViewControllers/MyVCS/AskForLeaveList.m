//
//  AskForLeaveList.m
//  hlJXT
//
//  Created by Jier on 16/3/26.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "AskForLeaveList.h"
#import "AskForLeave.h"
@interface AskForLeaveList ()

@end

@implementation AskForLeaveList

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的请假";
    UIBarButtonItem *publishBT=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"plusAdd@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(publish)];
    self.navigationItem.rightBarButtonItem = publishBT;


}

#pragma mark - 学生写请假
-(void)publish
{
    AskForLeave *askforleave=[[AskForLeave alloc]init];
    askforleave.UIState =1;
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:askforleave];
    [self presentViewController:nav animated:YES completion:NULL];
}




#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell2"];
    
    cell.textLabel.text=@"事假";
    cell.detailTextLabel.text = @"申请时间：2015-03-25";
    cell.detailTextLabel.textColor = [UIColor grayColor];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AskForLeave *askforleave=[[AskForLeave alloc]init];
    askforleave.UIState = 0;
    [self.navigationController pushViewController:askforleave animated:YES];
}










@end
