//
//  DrooDownChooseDelegate.h
//  咨询Demo
//
//  Created by admin on 16/3/23.
//  Copyright © 2016年 zhuxianhong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol DrooDownChooseDelegate <NSObject>
@optional//可选择的
- (void)chooseThatSection:(NSInteger)section index:(NSInteger)index;
@end
@protocol DrooDownChooseDataSourse <NSObject>

- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (NSString *)titleInSection:(NSInteger)section index:(NSInteger)index;
- (NSInteger)defaultShowSection:(NSInteger)section;

@end
