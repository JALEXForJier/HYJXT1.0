//
//  AskForLeave.m
//  hlJXT
//
//  Created by Jier on 16/3/26.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "AskForLeave.h"

@interface AskForLeave ()

@end

@implementation AskForLeave

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_UIState == 0) {
        //看请假
        [self ViewUI];
    }
    else if (_UIState == 1)
    {
        //写请假
        [self writeUI];
    }
}

#pragma mark- 看请假界面
-(void)ViewUI
{
    
}




#pragma mark- 写请假界面
-(void)writeUI
{
    //写请假界面以present方式呈现出来
    
    self.navigationController.navigationBar.barTintColor=MainColor;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title=@"申请请假";
    self.navigationController.navigationBar.translucent=NO;
    UIBarButtonItem *CancelBT=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelPublish)];
    self.navigationItem.leftBarButtonItem = CancelBT;
    UIBarButtonItem *SureBT=[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(surelPublish)];
    self.navigationItem.rightBarButtonItem = SureBT;
}

-(void)cancelPublish
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)surelPublish
{
    
}










@end
