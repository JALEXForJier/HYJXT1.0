//
//  LoginModal.h
//  hlJXT
//
//  Created by Jier on 16/3/21.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModal : NSObject
//全局个人用户资料信息 
@property (nonatomic,strong)NSString *sessionID;    //每次登陆产生的token
@property (nonatomic,strong)NSString *userName;     //用户名字
@property (nonatomic,strong)NSString *userID;       //用户ID
@property (nonatomic,strong)NSString *role;         //用户角色 *教师 *学生 *家长
@property (nonatomic,strong)NSString *studentNum;   //如果是学生 则为学号  教师则为空




+(LoginModal*)grobleLoginModal;

@end
