//
//  StudentAskingForLeave.m
//  hlJXT
//
//  Created by Jier on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "StudentAskingForLeave.h"
#import "StudentAskingForLeaveCell.h"
@interface StudentAskingForLeave ()

@end

@implementation StudentAskingForLeave

- (void)viewDidLoad {
    [super viewDidLoad];
   
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StudentAskingForLeaveCell *cell = [[StudentAskingForLeaveCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"askingcell"];
    cell.titleLabel.text=@"黎球的第三十九次请假";
    cell.studentNameLabel.text=@"黎球";
    cell.askingStateLabel.text=@"未通过";
    
    [cell UIDetailSetWithWidth:[UIScreen mainScreen].bounds.size.width/320];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 94*[UIScreen mainScreen].bounds.size.width/320;
}












@end
