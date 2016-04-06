//
//  recipeDetailView.m
//  hlJXT
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "recipeDetailView.h"
#define  widthScale SCREEN_WIDTH/320
@interface recipeDetailView ()
@property (nonatomic,strong)UIImageView *recipeImageView;


@end

@implementation recipeDetailView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addImageView];
    // Do any additional setup after loading the view.
}
- (void)addImageView{
    self.recipeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100*widthScale, SCREEN_WIDTH, 300*widthScale)];    
    [self.recipeImageView setImage:self.recipeImage];
    [self.view addSubview:self.recipeImageView];
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
