//
//  schoolItemModel.h
//  hlJXT
//
//  Created by admin on 16/4/5.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface schoolItemModel : NSObject
@property (nonatomic,strong)NSString *itemName;
@property (nonatomic,strong)NSString *itemImage;
- (id)initWithImageName:(NSString *) imageName Name:(NSString *) name;
@end
