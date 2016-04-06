//
//  writeExerciseView.m
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "writeExerciseView.h"

@interface writeExerciseView ()<UITextViewDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *publicExerciseTeacher;//发布活动教师
@property (weak, nonatomic) IBOutlet UITextField *publicExerciseTime;//发布活动时间
@property (weak, nonatomic) IBOutlet UIButton *publicExerciseImage;//发布活动图片

@property (weak, nonatomic) IBOutlet UITextField *publicExerciseTitle;//发布活动标题
@property (weak, nonatomic) IBOutlet UITextView *publicExerciseContent;//发布活动内容
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *selectTitle;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (nonatomic,strong)UIDatePicker *datePicker;


@end

@implementation writeExerciseView
//push出界面是底部栏隐藏
-(void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.hidden=NO;
}
//退出界面是底部栏显示
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"send.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(publicExercise)];
    [self addPublicExerciseAllThings];
    // Do any additional setup after loading the view from its nib.
}
- (void)publicExercise{
    
}
- (void)addPublicExerciseAllThings{
    self.name.text = @"发布人:";
    self.time.text = @"发布时间:";
    self.selectTitle.text = @"标题:";
    self.content.text = @"活动内容:";
    
    self.publicExerciseTime.delegate    = self;
    self.publicExerciseTitle.delegate   = self;
    self.publicExerciseContent.delegate = self;
    self.publicExerciseTeacher.text = @"习大大老师";
    
    //添加时间选择器
    self.datePicker=[[UIDatePicker alloc]init];
    // 设置区域为中国简体中文
    self.datePicker.locale =[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    // 设置picker的显示模式：只显示日期
    self.datePicker.datePickerMode = UIDatePickerModeDate;
//    [self.datePicker addTarget:self action:@selector(changTime) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *cancelItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(canceltext)];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *sureItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(sureButton)];
    //创建工具条
    UIToolbar *toolbar1=[[UIToolbar alloc]init];
    //设置工具条的颜色
    toolbar1.barTintColor=[UIColor lightGrayColor];
    //设置工具条的frame
    toolbar1.frame=CGRectMake(0, 0, SCREEN_WIDTH, 44);
    toolbar1.items = @[cancelItem, spaceItem, sureItem];
    self.publicExerciseTime.inputView = self.datePicker;
    //附件
    self.publicExerciseTime.inputAccessoryView = toolbar1;
    
}

- (void)canceltext{
    [self.publicExerciseTime endEditing:YES];
}

- (void)sureButton{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *prettyVersion = [dateFormat stringFromDate:self.datePicker.date];
    self.publicExerciseTime.text = prettyVersion;
    [self.publicExerciseTime endEditing:YES];
    
}

- (IBAction)addPictureButton:(id)sender {
    //访问用户相册
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    pickerController.delegate = self;
    //图片来源
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //UIImagePickerController显示模式（竖屏模式）
    pickerController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    pickerController.allowsEditing = YES;
    [self presentViewController:pickerController animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        //
    }];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSString *imagename = [NSString stringWithFormat:@"Activitypicture.png"];
     [self saveImage:image withName:imagename];
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imagename];
    
    UIImage *savedImage = [UIImage imageWithContentsOfFile:fullPath];
    
    [self.publicExerciseImage setImage:savedImage forState:UIControlStateNormal];
    self.publicExerciseImage.tag = 777;
    
//    NSData *data = UIImageJPEGRepresentation(savedImage, 0.1);

    
}
//保存图片
- (void)saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.1);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
}

#pragma mark textFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark UITextViewDelegate

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = self.view.bounds;
        frame.origin.y= 0.0;
        self.view.bounds = frame;
    }];
    return YES;
}
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    CGFloat offset;
    if (textView.tag == 2){
        offset = self.view.bounds.origin.y+200;
    }
    NSLog(@"%f",offset);
    if (offset >=0) {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect frame = self.view.bounds;
            frame.origin.y = offset;
            self.view.bounds=frame;
        }];
    }
    return  YES;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
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
