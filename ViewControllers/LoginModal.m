//
//  LoginModal.m
//  hlJXT
//
//  Created by Jier on 16/3/21.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "LoginModal.h"

@implementation LoginModal

+(LoginModal*)grobleLoginModal{
    static LoginModal *only;
    if (only==nil) {
        only=[[LoginModal alloc]init];
    }
    return only;
}

@end
