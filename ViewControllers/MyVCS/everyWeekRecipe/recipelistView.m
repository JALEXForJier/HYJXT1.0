//
//  recipelistView.m
//  hlJXT
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "recipelistView.h"
#import "DrooDownChooseDelegate.h"
#import "DorpDownListView.h"
#import "recipeListCell.h"
#import "recipeDetailView.h"

#define  widthScale SCREEN_WIDTH/320

@interface recipelistView ()<DrooDownChooseDataSourse,DrooDownChooseDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSMutableArray *threeMealArray;//下拉筛选数组
@property (nonatomic,strong)NSMutableArray *recipeArray;//食谱数组
@property (nonatomic,strong)UICollectionView *recipeCollectionView;//食谱列表



@end

@implementation recipelistView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:56/255.0 green:183/255.0 blue:238/255.0 alpha:1.0];
    self.navigationItem.title = @"每周食谱";
    [self initData];
    [self setDropListView];
    [self.view addSubview:self.recipeCollectionView];
    // Do any additional setup after loading the view.
}
//初始化数据
-(void)initData{
    self.recipeArray = [[NSMutableArray alloc]init];
    //周星期几数组
    NSArray *weekArray = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    //早中晚三餐数组
    NSArray *mealsArray = @[@"早餐",@"午餐",@"晚餐"];
    self.threeMealArray = [[NSMutableArray alloc]initWithObjects:weekArray,mealsArray, nil];
}
//添加筛选框
- (void)setDropListView{
    
    DorpDownListView *dropList = [[DorpDownListView alloc]initAndWithFrame:CGRectMake(0, 0, 320*widthScale, 50*widthScale) WithState:NO dataSource:self delegate:self];
    dropList.mSuperView = self.view;
    [self.view addSubview:dropList];
    
}
//添加食谱列表
- (UICollectionView *)recipeCollectionView{
    if (_recipeCollectionView == nil) {
        //自动布局网格对象
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//        flowLayout.footerReferenceSize = CGSizeMake(SCREEN_HEIGHT, 50*widthScale);
        //网格布局
        _recipeCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 51*widthScale, SCREEN_WIDTH, 430*widthScale) collectionViewLayout:flowLayout];

        _recipeCollectionView.backgroundColor = [UIColor whiteColor];
        _recipeCollectionView.alwaysBounceVertical = YES;
        _recipeCollectionView.delegate = self;
        _recipeCollectionView.dataSource = self;
        [_recipeCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"reusableView"];
        UINib *nib = [UINib nibWithNibName:@"recipeListCell" bundle:nil];
        [_recipeCollectionView registerNib:nib forCellWithReuseIdentifier:@"cellId"];
    }
    return _recipeCollectionView;
}
#pragma mark DrooDownChooseDataSourse,DrooDownChooseDelegate

- (NSInteger)numberOfSections{
    return self.threeMealArray.count;
}
- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return [self.threeMealArray[section] count];
}
- (NSString *)titleInSection:(NSInteger)section index:(NSInteger)index{
    return self.threeMealArray[section][index];
}
- (NSInteger)defaultShowSection:(NSInteger)section{
    return 0;
}
- (void)chooseThatSection:(NSInteger)section index:(NSInteger)index{
    NSLog(@"选择了第几行:%ld 第几列:%ld",section,index);
}
#pragma mark UICollectionViewDataSource,UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    recipeListCell *recipeCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    [recipeCell updateRecipeWithModel:nil];
    return recipeCell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    recipeDetailView *detailView = [[recipeDetailView alloc]init];
    detailView.recipeImage = [UIImage imageNamed:@"teacherHead.png"];
    detailView.navigationItem.title = @"青椒土豆丝";
    [self.navigationController pushViewController:detailView animated:YES];
}
//定义collectionView是否可以被选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
#pragma mark UICollectionViewDelegateFlowLayout
//定义collectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100*widthScale,100*widthScale);
}
//定义collectionView的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0,0,0,0);
}
//定义collectionView纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//定义collectionView横向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
////添加脚部视图
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
//    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50*widthScale)];
//    [reusableView addSubview:view1];
//    return reusableView;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
