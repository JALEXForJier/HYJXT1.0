//
//  StudentAskingForLeaveCell.h
//  hlJXT
//
//  Created by Jier on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentAskingForLeaveCell : UITableViewCell
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *studentNameLabel;
@property (nonatomic,strong) UILabel *askingStateLabel;
-(void)UIDetailSetWithWidth:(float)width;
@end
