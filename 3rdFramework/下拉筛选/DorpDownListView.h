//
//  DorpDownListView.h
//  咨询Demo
//
//  Created by admin on 16/3/23.
//  Copyright © 2016年 zhuxianhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrooDownChooseDelegate.h"
#define SECTION_BUT_TAG 1000
#define SECTION_IN_TAG 2000
@interface DorpDownListView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,assign)id <DrooDownChooseDelegate> dropDownDelegate;
@property (nonatomic,assign)id <DrooDownChooseDataSourse> dropDownDatasourse;
/**当前展示的分组，默认-1时都没有展开*/
@property (nonatomic)NSInteger currentExtendSection;
/***/
@property (nonatomic,strong)UIView      *mSuperView;
/**蒙版View*/
@property (nonatomic,strong)UIView      *mTableBaseView;
/**展示年级和组别的TableView*/
@property (nonatomic,strong)UITableView *mTableView;
/**年级*/
@property (nonatomic,strong)UIButton *TermName;
/**组别*/
@property (nonatomic,strong)UIButton *ChaptersName;

@property (nonatomic) BOOL DropViewState;  //默认为0不做改变 1时设置背景颜色


- (id)initAndWithFrame:(CGRect)frame WithState:(BOOL)state dataSource:(id)datasource delegate:(id)delegate;

- (void)setTitle:(NSString *)title inSection:(NSInteger)section;
- (BOOL)isShow;
- (void)hideExtendedChooseView;

@end
