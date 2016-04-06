//
//  MyGrade.m
//  hlJXT
//
//  Created by Jier on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "MyGrade.h"
#import "DrooDownChooseDelegate.h"
#import "DorpDownListView.h"
#import "CBChartView.h"
@interface MyGrade ()<DrooDownChooseDataSourse,DrooDownChooseDelegate>
@property (weak, nonatomic) IBOutlet UIView *dropView;
@property (weak, nonatomic) IBOutlet UIView *gradeView;
@property (nonatomic,strong) NSMutableArray *selectedData;

@end

@implementation MyGrade

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"XXX的成绩分析";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setDropListView];
    [self setGradeViewA];
}


-(void)setDropListView
{
    
    self.selectedData = [[NSMutableArray alloc]initWithObjects:@"请选择科目",@"语文",@"数学",@"英语",@"物理", nil];
    
    CGRect frame=self.dropView.frame;
    DorpDownListView *dropList = [[DorpDownListView alloc]initAndWithFrame:frame WithState:YES dataSource:self delegate:self];
    dropList.mSuperView = self.view;
    dropList.mSuperView.frame=frame;
    [self.view addSubview:dropList];
}

-(void)setGradeViewA
{
    // 使用
    CBChartView *chartView = [[CBChartView alloc] initWithFrame:CGRectMake(0, 0, self.gradeView.frame.size.width, self.gradeView.frame.size.height)];
    chartView.shutDefaultAnimation = YES;
    [self.gradeView addSubview:chartView];
    chartView.xValues = @[@"0",@"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17"];
    chartView.yValues = @[@"75", @"20", @"90", @"50", @"55", @"60", @"50", @"50", @"34", @"67"];
    chartView.chartWidth = 2.0;
    chartView.chartColor = [UIColor purpleColor];
    
    [UIView animateWithDuration:1 animations:^{
        chartView.frame = CGRectMake(0, 0, self.gradeView.frame.size.width, self.gradeView.frame.size.height);
    }];


}



#pragma mark DrooDownChooseDataSourse,DrooDownChooseDelegate
- (NSInteger)numberOfSections{
    return 1;
}
- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return self.selectedData.count;
}
- (NSString *)titleInSection:(NSInteger)section index:(NSInteger)index{
    return self.selectedData[index];
}
- (NSInteger)defaultShowSection:(NSInteger)section{
    return 0;
}

//选择学科代理方法
- (void)chooseThatSection:(NSInteger)section index:(NSInteger)index{
    NSLog(@"我选择了%@",self.selectedData[index]);
}
















@end
