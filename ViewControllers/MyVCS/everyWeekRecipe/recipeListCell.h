//
//  recipeListCell.h
//  hlJXT
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface recipeListCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *recipeimageView;
@property (weak, nonatomic) IBOutlet UILabel *recipeName;

- (void)updateRecipeWithModel:(id)model;
@end
