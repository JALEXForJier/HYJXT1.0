//
//  ClassCircle.m
//  hlJXT
//
//  Created by Jier on 16/3/24.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "ClassCircle.h"
#import "ClassCircleCell.h"
#import "PublishClassCircle.h"
@interface ClassCircle ()

@end

@implementation ClassCircle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"班级圈";
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    UIBarButtonItem *publishBT=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"plusAdd@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(publish)];
    self.navigationItem.rightBarButtonItem = publishBT;
    self.view.backgroundColor=[UIColor whiteColor];
    
}

-(void)publish
{
    PublishClassCircle *vc=[[PublishClassCircle alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:NULL];
}




#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClassCircleCell *cell = [[ClassCircleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.bodyLabel.text = @"哈啊啊啊啊啊哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈，今天天气不错啊，很适合四处走动走动啊啊啊啊哈哈哈";
    [cell UIDetailSetWithWidth:[UIScreen mainScreen].bounds.size.width/320];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClassCircleCell *cell=(ClassCircleCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}














@end
