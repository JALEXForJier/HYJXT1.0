//
//  newListCell.h
//  hlJXT
//
//  Created by admin on 16/3/25.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newListCell : UITableViewCell

@property (strong, nonatomic) UIImageView *newsImageView;
@property (strong, nonatomic) UILabel *titleWithNews;
@property (strong, nonatomic) UILabel *timeWithNews;
@property (nonatomic,strong)UIImageView *lineImage;


- (void)adjustCellwithModel:(id)model;

@end
