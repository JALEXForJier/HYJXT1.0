//
//  DorpDownListView.m
//  咨询Demo
//
//  Created by admin on 16/3/23.
//  Copyright © 2016年 zhuxianhong. All rights reserved.
//

#import "DorpDownListView.h"
#define DEGREES_TO_RADIANS(angle) ((angle)/180.0 *M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians)*(180.0/M_PI))
#define  widthScale SCREEN_WIDTH/320

@implementation DorpDownListView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (id)initAndWithFrame:(CGRect)frame WithState:(BOOL)state dataSource:(id)datasource delegate:(id)delegate{
    
    self.DropViewState=state;
    self = [super initWithFrame:frame];
    if (self) {
        
        self.TermName     = [[UIButton alloc]init];
        self.ChaptersName = [[UIButton alloc]init];
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        self.currentExtendSection = -1;
        self.dropDownDelegate = delegate;
        self.dropDownDatasourse   = datasource;
        NSInteger sectionNum = 0;
        if ([self.dropDownDelegate respondsToSelector:@selector(numberOfSections)]) {
            sectionNum = [self.dropDownDatasourse numberOfSections];
        }
        if (sectionNum == 0) {
            self = nil;
        }
        //初始化默认显示view
        CGFloat sectionWidth = (1.0*(self.bounds.size.width)/sectionNum);
        for (NSInteger i = 0; i <sectionNum; i++) {
            //课程知识点按钮选项位置
            if (i == 0) {
                [self addButton:self.TermName index:i width:sectionWidth];
            }else{
                [self addButton:self.ChaptersName index:i width:sectionWidth];
            }
        }
    }
    return self;
}
- (void)addButton:(UIButton *)button index:(NSInteger)i width:(CGFloat)sectionWidth{
    
    button = [[UIButton alloc] initWithFrame:CGRectMake((sectionWidth+2)*i, 0, sectionWidth-2*widthScale, self.bounds.size.height)];
    
    button.tag = SECTION_BUT_TAG+i;
    [button addTarget:self action:@selector(sectionBtnTouch:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor whiteColor];
    //按钮标题
    NSString *sectionBtnTitle = [[NSString alloc]init];
    
    if ([self.dropDownDatasourse respondsToSelector:@selector(titleInSection:index:)]) {
        sectionBtnTitle = [self.dropDownDatasourse titleInSection:i index:[self.dropDownDatasourse defaultShowSection:i]];
    }
    
    [button  setTitle:sectionBtnTitle forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    
    //自定义UI
    if(self.DropViewState == YES)
    {   [button setBackgroundColor:MainColor];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    
    
    [self addSubview:button];
    UIImageView *sectionBtnIv = [[UIImageView alloc] initWithFrame:CGRectMake((sectionWidth+ 1)*i+(sectionWidth - 20), self.bounds.size.height/2, 12, 12)];
    [sectionBtnIv setImage:[UIImage imageNamed:@"down_dark.png"]];
    [sectionBtnIv setContentMode:UIViewContentModeScaleToFill];
    sectionBtnIv.tag = SECTION_IN_TAG + i;
    [self addSubview: sectionBtnIv];
    
}
- (void)sectionBtnTouch:(UIButton *)button{
    
    NSInteger sectionButton = button.tag - SECTION_BUT_TAG;
    UIImageView *currentIV= (UIImageView *)[self viewWithTag:(SECTION_IN_TAG +self.currentExtendSection)];
    
    [UIView animateWithDuration:0.3 animations:^{
        currentIV.transform = CGAffineTransformRotate(currentIV.transform, DEGREES_TO_RADIANS(180));
    }];
    
    if (self.currentExtendSection == sectionButton) {
        [self hideExtendedChooseView];
    }else{
        self.currentExtendSection = sectionButton;
        currentIV = (UIImageView *)[self viewWithTag:SECTION_IN_TAG + self.currentExtendSection];
        [UIView animateWithDuration:0.3 animations:^{
            currentIV.transform = CGAffineTransformRotate(currentIV.transform, DEGREES_TO_RADIANS(180));
        }];
        [self showChooseListViewInSection:self.currentExtendSection choosedIndex:[self.dropDownDatasourse defaultShowSection:self.currentExtendSection]];
    }
}
- (void)setTitle:(NSString *)title inSection:(NSInteger) section
{
    UIButton *btn = (id)[self viewWithTag:SECTION_BUT_TAG +section];
    [btn setTitle:title forState:UIControlStateNormal];
}

- (BOOL)isShow
{
    if (self.currentExtendSection == -1) {
        return NO;
    }
    return YES;
}
-  (void)hideExtendedChooseView
{
    if (self.currentExtendSection != -1) {
        self.currentExtendSection = -1;
        CGRect rect = self.mTableView.frame;
        rect.size.height = 0;
        [UIView animateWithDuration:0.3 animations:^{
            self.mTableBaseView.alpha = 1.0f;
            self.mTableView.alpha = 1.0f;
            
            self.mTableBaseView.alpha = 0.2f;
            self.mTableView.alpha = 0.2;
            
            self.mTableView.frame = rect;
        }completion:^(BOOL finished) {
            [self.mTableView removeFromSuperview];//把当前view从他的父view中移除
            [self.mTableBaseView removeFromSuperview];
        }];
    }
}

-(void)showChooseListViewInSection:(NSInteger)section choosedIndex:(NSInteger)index
{
    if (!self.mTableView) {
        self.mTableBaseView = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        self.mTableBaseView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
        
        UITapGestureRecognizer *bgTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgTappedAction:)];
        [self.mTableBaseView addGestureRecognizer:bgTap];
        self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width , 240) style:UITableViewStylePlain];
        self.mTableView.delegate = self;
        self.mTableView.dataSource = self;
        self.mTableView.bounces = NO;
    }
    
    //修改tableview的frame
    int sectionWidth = (self.frame.size.width)/[self.dropDownDatasourse numberOfSections];
    CGRect rect = self.mTableView.frame;
    rect.origin.x = sectionWidth *section + 5;
    rect.size.width = sectionWidth - 5;
    rect.size.height = 0;
    self.mTableView.frame = rect;
    [self.mSuperView addSubview:self.mTableBaseView];
    [self.mSuperView addSubview:self.mTableView];
    
    //动画设置位置
    rect .size.height = 240;
    [UIView animateWithDuration:0.3 animations:^{
        self.mTableBaseView.alpha = 0.2;
        self.mTableView.alpha = 0.2;
        
        self.mTableBaseView.alpha = 1.0;
        self.mTableView.alpha = 1.0;
        self.mTableView.frame =  rect;
    }];
    [self.mTableView reloadData];
}

-(void)bgTappedAction:(UITapGestureRecognizer *)tap
{
    [self resumeImagePlace];
    
}
- (void)resumeImagePlace{
    UIImageView *currentIV = (UIImageView *)[self viewWithTag:(SECTION_IN_TAG + self.currentExtendSection)];
    [UIView animateWithDuration:0.3 animations:^{
        currentIV.transform = CGAffineTransformRotate(currentIV.transform, DEGREES_TO_RADIANS(180));
        [self hideExtendedChooseView];
    }];
    
}
#pragma mark -- UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    if ([self.dropDownDelegate respondsToSelector:@selector(chooseThatSection:index:)]) {
        NSString *chooseCellTitle = [self.dropDownDatasourse titleInSection:self.currentExtendSection index:indexPath.row];
        UIButton *currentSectionBtn = (UIButton *)[self viewWithTag:SECTION_BUT_TAG + self.currentExtendSection];
        [currentSectionBtn setTitle:chooseCellTitle forState:UIControlStateNormal];
        
        [self.dropDownDelegate chooseThatSection:self.currentExtendSection index:indexPath.row];
        
        [self resumeImagePlace];
    }
}

#pragma mark -- UITableView DataSource


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dropDownDatasourse numberOfRowsInSection:self.currentExtendSection];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = [self.dropDownDatasourse titleInSection:self.currentExtendSection index:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    
    return cell;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
