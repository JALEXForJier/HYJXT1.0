//
//  newListCell.m
//  hlJXT
//
//  Created by admin on 16/3/25.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "newListCell.h"
#define widthScale SCREEN_WIDTH/320

@implementation newListCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)adjustCellwithModel:(id)model{
    self.newsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(8*widthScale, 8*widthScale, 120*widthScale, 70*widthScale)];
    self.titleWithNews = [[UILabel alloc]initWithFrame:CGRectMake(130*widthScale, 8*widthScale, 180*widthScale, 50*widthScale)];
    self.timeWithNews = [[UILabel alloc]initWithFrame:CGRectMake(130*widthScale, 60*widthScale, 180*widthScale, 20*widthScale)];
    self.timeWithNews.textColor = [UIColor lightGrayColor];
    [self.newsImageView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"backp1.png"]];
       self.timeWithNews.text = @"1212-12-12";
    self.titleWithNews.text = @"中华人民共和国成立了中华人民共和国成立";
    
    self.titleWithNews.numberOfLines = 0;
    self.titleWithNews.lineBreakMode = NSLineBreakByCharWrapping;
    [self.titleWithNews adjustsFontSizeToFitWidth];
    self.lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(8*widthScale , 80*widthScale, SCREEN_WIDTH, 1*widthScale)];
    self.lineImage.image = [UIImage imageNamed:@"img_hline_trans_nav.png"];
    [self addSubview:self.lineImage];
    [self addSubview:self.newsImageView];
    [self addSubview:self.timeWithNews];
    [self addSubview:self.self.titleWithNews];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
