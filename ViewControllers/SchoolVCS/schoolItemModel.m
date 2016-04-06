//
//  schoolItemModel.m
//  hlJXT
//
//  Created by admin on 16/4/5.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "schoolItemModel.h"

@implementation schoolItemModel
- (id)initWithImageName:(NSString *) imageName Name:(NSString *) name{
    if (self = [super init]) {
        _itemName = name;
        _itemImage = imageName;
    }
    return self;
}
@end
