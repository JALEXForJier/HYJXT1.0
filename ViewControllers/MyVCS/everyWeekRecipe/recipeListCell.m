//
//  recipeListCell.m
//  hlJXT
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "recipeListCell.h"

@implementation recipeListCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)updateRecipeWithModel:(id)model{
    [self.recipeimageView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"teacherHead.png"]];
    self.recipeName.text = @"青椒土豆丝";
}
@end
