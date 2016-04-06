//
//  MessageGrobleNavigation.m
//  hlJXT
//
//  Created by Jier on 16/3/29.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "MessageGrobleNavigation.h"

@interface MessageGrobleNavigation ()

@end

@implementation MessageGrobleNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.barTintColor=MainColor;
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationBar.tintColor=[UIColor whiteColor];
    self.navigationBar.translucent=NO;

  }





@end
