//
//  School.m
//  hlJXT
//
//  Created by Jier on 16/3/21.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "School.h"
#import "TeacherListView.h"
#import "ScloolDetailView.h"
#import "scloolNewsList.h"
#import "headmasterTeacherController.h"
#import "studentsHotLine.h"
#import "schoolItemModel.h"
#import "schoolCollectionCell.h"

#define  widthScale SCREEN_WIDTH/320

@interface School ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UIScrollView *scrollview;//图片轮播器
@property (nonatomic,strong) UIPageControl *pagecontroller;
@property (strong, nonatomic) UIScrollView *newsScrollView;//新闻轮播
@property (nonatomic,strong)UILabel *leftLabel;
@property (nonatomic,strong)UILabel *middleLabel;
@property (nonatomic,strong)UILabel *rightLabel;
@property (nonatomic,strong)UIImageView *zixunImageView;
@property (nonatomic,strong)NSMutableArray *itemModelArray;
@property (nonatomic,strong)UICollectionView *itemCollectionView;

@end
@implementation School

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itemModelArray = [[NSMutableArray alloc]init];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:56/255.0 green:183/255.0 blue:238/255.0 alpha:1.0];
    //    self.navigationController.tabBarControlle
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    self.navigationItem.title=@"xx中学";
    self.navigationController.navigationBar.translucent=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    self.zixunImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 190*widthScale, 80*widthScale, 80*widthScale)];
    self.zixunImageView.image = [[UIImage imageNamed:@"icon_express@2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.view addSubview:self.zixunImageView];
    [self imageScroll];
    [self addCollectionViewData];
    [self.view addSubview:self.itemCollectionView];
    
#warning me
    //if IPhone 6p 某个按钮特别处理
    
    
}

//添加collectionView
- (UICollectionView *)itemCollectionView{
    if (_itemCollectionView == nil) {
        //自动布局网格对象
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _itemCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 300*widthScale, SCREEN_WIDTH, SCREEN_HEIGHT-300*widthScale) collectionViewLayout:flowLayout];
        _itemCollectionView.backgroundColor = [UIColor whiteColor];
        _itemCollectionView.alwaysBounceVertical = YES;
        _itemCollectionView.delegate = self;
        _itemCollectionView.dataSource = self;
        UINib *nib = [UINib nibWithNibName:@"schoolCollectionCell" bundle:nil];
        [_itemCollectionView registerNib:nib forCellWithReuseIdentifier:@"cellId"];
    }
    return _itemCollectionView;
}
- (void)addCollectionViewData{
    schoolItemModel *schoolDetail = [[schoolItemModel alloc]initWithImageName:@"noti.png" Name:@"学校介绍"];
    schoolItemModel *teacherDetail = [[schoolItemModel alloc]initWithImageName:@"jiaoshi.png" Name:@"教师介绍"];
    schoolItemModel *newsListDetail = [[schoolItemModel alloc]initWithImageName:@"message.png" Name:@"新闻动态"];
    schoolItemModel *headmaster = [[schoolItemModel alloc]initWithImageName:@"xinxiang.png" Name:@"校长热线"];
    [self.itemModelArray addObject:schoolDetail];
    [self.itemModelArray addObject:teacherDetail];
    [self.itemModelArray addObject:newsListDetail];
    [self.itemModelArray addObject:headmaster];
    
}
#pragma mark-首图轮播
-(void)imageScroll   //图片轮播
{
    UIScrollView *scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, 180)];
    scrollview.pagingEnabled=YES;
    scrollview.bounces=NO;
    scrollview.userInteractionEnabled=NO;
    scrollview.contentSize=CGSizeMake(Width*3, 180);
    for (int i=0;i<3 ; i++) {
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(i*Width, 0, Width, 180)];
        imageview.image=[UIImage imageNamed:[NSString stringWithFormat:@"photo%d.jpg",i]];
        [scrollview addSubview:imageview];
    }
    self.scrollview=scrollview;
    
    self.pagecontroller=[[UIPageControl alloc]init];
    CGSize size=[_pagecontroller sizeForNumberOfPages:3];
    self.pagecontroller.numberOfPages=3;
    _pagecontroller.frame=CGRectMake(0, 0, size.width, size.height);
    _pagecontroller.center=CGPointMake(Width-size.width*2, 200);
    _pagecontroller.currentPageIndicatorTintColor=[UIColor blueColor];
    _pagecontroller.pageIndicatorTintColor=[UIColor grayColor];
    [self.view addSubview:self.scrollview];
    [self.view addSubview:self.pagecontroller];
    [self addScorllView];
    NSTimer *scrollTime=[NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(scroll) userInfo:nil repeats:YES];
}

-(void)scroll
{
    if (self.pagecontroller.currentPage==2) {
        [self.scrollview setContentOffset:CGPointMake(0, 0) animated:YES];
        [self.newsScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        self.pagecontroller.currentPage=0;
    }else{
        [self.scrollview setContentOffset:CGPointMake(self.scrollview.contentOffset.x+Width, 0) animated:YES];
        [self.newsScrollView setContentOffset:CGPointMake(0, self.newsScrollView.contentOffset.y+80*widthScale) animated:YES];
        self.pagecontroller.currentPage++;
    }
}
#pragma mark
//添加新闻轮播
- (void)addScorllView{
    self.newsScrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(100*widthScale, 190*widthScale, Width-110*widthScale, 80*widthScale)];
    self.newsScrollView.pagingEnabled=YES;
    self.newsScrollView.bounces=NO;
    self.newsScrollView.userInteractionEnabled=NO;
    self.newsScrollView.contentSize=CGSizeMake(Width-110*widthScale, 80*3*widthScale);
    [self.view addSubview:self.newsScrollView];
    [self addShreeLabel];
    
    self.newsScrollView.backgroundColor = [UIColor greenColor];
    [self setShreeLabelLenth];
}
//添加三个label
- (void)addShreeLabel{
    self.leftLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.leftLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.6 alpha:0.6];
    self.leftLabel.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    
    self.middleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.middleLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.6 alpha:0.6];
    self.middleLabel.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    
    self.rightLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.rightLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.6 alpha:0.6];
    self.rightLabel.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    
}
//三条新闻信息在newsScrollView上的位置
- (void)setShreeLabelLenth{
    self.leftLabel.frame = CGRectMake(0, 50*widthScale, Width-110*widthScale, 30*widthScale);
    self.middleLabel.frame = CGRectMake(0, 50*widthScale, Width-110*widthScale, 30*widthScale);
    self.rightLabel.frame = CGRectMake(0, 50*widthScale, Width-110*widthScale, 30*widthScale);
    self.leftLabel.text = @"G20峰会在杭州举行G20峰会在杭州举行G20峰会在杭州举行G20峰会在杭州举行";
    self.middleLabel.text = @"习近平视察小和尚";
    self.rightLabel.text = @"习大大周末去西湖";
    self.leftLabel.numberOfLines = 0;
    self.middleLabel.numberOfLines = 0;
    self.middleLabel.numberOfLines = 0;
    self.leftLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.middleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.rightLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.leftLabel.font = [UIFont systemFontOfSize:13];
    self.middleLabel.font = [UIFont systemFontOfSize:13];
    self.rightLabel.font = [UIFont systemFontOfSize:13];
    
    self.newsScrollView.contentSize = CGSizeMake(self.newsScrollView.bounds.size.width, 80*widthScale*3);
    
    UIImageView *leftimageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width-110*widthScale, 80*widthScale)];
    leftimageview.image=[UIImage imageNamed:@"backp0.png"];
    [leftimageview addSubview:self.leftLabel];
    [self.newsScrollView addSubview:leftimageview];
    
    UIImageView *middleimageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 80*widthScale, Width-110*widthScale, 80*widthScale)];
    middleimageview.image=[UIImage imageNamed:@"backp0.png"];
    [middleimageview addSubview:self.middleLabel];
    [self.newsScrollView addSubview:middleimageview];
    
    UIImageView *rightimageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 80*widthScale*2, Width-110*widthScale, 80*widthScale)];
    rightimageview.image=[UIImage imageNamed:@"backp0.png"];
    [rightimageview addSubview:self.rightLabel];
    [self.newsScrollView addSubview:rightimageview];
    
}

#pragma mark 4个模块处理


#pragma mark UICollectionViewDataSource,UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemModelArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    schoolCollectionCell *schoolCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    schoolItemModel *itemModel = [self.itemModelArray objectAtIndex:indexPath.row];
    schoolCell.schoolDetail.text = itemModel.itemName;
    schoolCell.schoolImageView.image =[UIImage imageNamed:itemModel.itemImage];
    if ((indexPath.row + 1) % 4 == 0) {
        [schoolCell.rightLine setHidden:YES];
    }
    else
        [schoolCell.rightLine setHidden:NO];
    return schoolCell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80*widthScale, 80*widthScale);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            //学校介绍
            ScloolDetailView *scloolDetail = [[ScloolDetailView alloc]init];
            [self.navigationController pushViewController:scloolDetail animated:YES];
            
        }
            break;
        case 1:
        {
            //教师介绍
            TeacherListView *teacher = [[TeacherListView alloc]init];
            [self.navigationController pushViewController:teacher animated:YES];
        }
            break;
        case 2:
        {
            //新闻动态
            
            scloolNewsList *newsList = [[scloolNewsList alloc]init];
            [self.navigationController pushViewController:newsList animated:YES];
            
        }
            break;
        case 3:
        {
            //校长热线
            headmasterTeacherController *headmaster = [[headmasterTeacherController alloc]init];
            [self.navigationController pushViewController:headmaster animated:YES];
            //            studentsHotLine *students = [[studentsHotLine alloc]init];
            //            [self.navigationController pushViewController:students animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}










@end
