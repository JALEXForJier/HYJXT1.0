//
//  PublishClassCircle.m
//  hlJXT
//
//  Created by Jier on 16/3/25.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "PublishClassCircle.h"

@interface PublishClassCircle ()

@end

@implementation PublishClassCircle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=MainColor;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title=@"发布动态";
    self.navigationController.navigationBar.translucent=NO;
    
    self.view.backgroundColor=[UIColor colorWithRed:217/255.0 green:243/255.0 blue:254/255.0 alpha:1.0];
    
    UIBarButtonItem *CancelBT=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelPublish)];
    self.navigationItem.leftBarButtonItem = CancelBT;
    
    UIBarButtonItem *SureBT=[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(surelPublish)];
    self.navigationItem.rightBarButtonItem = SureBT;
    [self addPhotoBtnWithWidth:[UIScreen mainScreen].bounds.size.width/320];

    
}



-(void)cancelPublish
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)surelPublish
{
    
}



#pragma mark - 设置9个添加图片按钮

-(void)addPhotoBtnWithWidth:(float)width
{
    self.photoBtn1 = [[UIButton alloc]init];
    self.photoBtn2 = [[UIButton alloc]init];
    self.photoBtn3 = [[UIButton alloc]init];
    self.photoBtn4 = [[UIButton alloc]init];
    self.photoBtn5 = [[UIButton alloc]init];
    self.photoBtn6 = [[UIButton alloc]init];
    self.photoBtn7 = [[UIButton alloc]init];
    self.photoBtn8 = [[UIButton alloc]init];
    self.photoBtn9 = [[UIButton alloc]init];
    
    self.photoLists = [[NSMutableArray alloc]initWithObjects:_photoBtn1,_photoBtn2,_photoBtn3,_photoBtn4,_photoBtn5,_photoBtn6,_photoBtn7,_photoBtn8, _photoBtn9,nil];
    int tagnum =1;
    for ( UIButton *btn in self.photoLists) {
        btn.hidden=YES;
        [btn setBackgroundImage:[UIImage imageNamed:@"addpic@2x.png"] forState:UIControlStateNormal];
        btn.tag=tagnum;    //设置照片按钮标签
        tagnum++;
        [self.view addSubview:btn];
    }
    
    self.photoBtn1.frame=CGRectMake(5*width, 277*width, 73*width, 67*width);
    self.photoBtn2.frame=CGRectMake(83*width, 277*width, 73*width, 67*width);
    self.photoBtn3.frame=CGRectMake(161*width, 277*width, 73*width, 67*width);
    self.photoBtn4.frame=CGRectMake(241*width, 277*width, 73*width, 67*width);
    self.photoBtn5.frame=CGRectMake(5*width, 355*width, 73*width, 67*width);
    self.photoBtn6.frame=CGRectMake(83*width, 355*width, 73*width, 67*width);
    self.photoBtn7.frame=CGRectMake(161*width, 355*width, 73*width, 67*width);
    self.photoBtn8.frame=CGRectMake(241*width, 355*width, 73*width, 67*width);
    self.photoBtn9.frame=CGRectMake(5*width, 430*width, 73*width, 67*width);
    
    self.photoBtn1.hidden=NO;
}





@end
