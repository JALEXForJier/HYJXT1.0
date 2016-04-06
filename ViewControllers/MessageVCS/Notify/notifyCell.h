//
//  notifyCell.h
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface notifyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *notifyTitle;//通知标题
@property (weak, nonatomic) IBOutlet UILabel *notifyPeople;//通知发布的人
@property (weak, nonatomic) IBOutlet UILabel *notifyTime;//通知发布时间
- (void)updateCellWithModel:(id)model;//更新数据
@end
