//
//  scloolImageController.m
//  hlJXT
//
//  Created by admin on 16/3/26.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "scloolImageController.h"
#define widthScale SCREEN_WIDTH/320

@interface scloolImageController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewImages;

@end

@implementation scloolImageController
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.hidden=NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    [self addScloolImages:self.imageArray];
    // Do any additional setup after loading the view from its nib.
}
- (void)addScloolImages:(NSArray *)imageArray{
//    self.scrollViewImages.frame = CGRectMake(0, 128*widthScale, 320*widthScale, 271*widthScale);
    self.scrollViewImages.delegate = self;
   
    self.scrollViewImages.pagingEnabled = YES;
    //超出scrollView不可滑动
    self.scrollViewImages.bounces = NO;
    self.scrollViewImages.alwaysBounceHorizontal= NO;
    for (int image= 0; image < imageArray.count; image++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(320*image*widthScale, 0, 320*widthScale, 271*widthScale)];
        
        imageView.image = imageArray[image];
        [self.scrollViewImages addSubview:imageView];
    
    }
     self.scrollViewImages.contentSize = CGSizeMake(320*imageArray.count*widthScale, 0);
    [self.view addSubview:self.scrollViewImages];
}
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
