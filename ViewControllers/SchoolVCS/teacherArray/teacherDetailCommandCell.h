//
//  teacherDetailCommandCell.h
//  咨询Demo
//
//  Created by admin on 16/3/24.
//  Copyright © 2016年 zhuxianhong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface teacherDetailCommandCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *commendDetail;



- (void)updateDetailWithModel:(id)array ;
@end
