//
//  studentsHotLine.m
//  hlJXT
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "studentsHotLine.h"
#define widthScale SCREEN_WIDTH/320
@interface studentsHotLine ()<UITextViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextView *informationTestView;
@property (weak, nonatomic) IBOutlet UITextField *informationTitle;

@end

@implementation studentsHotLine
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
    self.navigationItem.title = @"发送邮件";
    self.view.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.7];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"send@2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(sendStudentsInformation)];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)sendStudentsInformation{
    NSLog(@"少时诵诗书");
}
- (void)addStudentsInformation{
    self.informationTitle.delegate = self;
    self.informationTestView.delegate = self;
    self.informationTestView.font = [UIFont systemFontOfSize:13];
    self.informationTestView.backgroundColor = [UIColor greenColor];
    self.informationTestView.returnKeyType = UIReturnKeyDefault;
    self.informationTestView.keyboardType = UIKeyboardTypeDefault;
    self.informationTestView.scrollEnabled = YES;
    self.informationTestView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    CGFloat frame;
    if (textView.tag == 1) {
        frame = self.view.bounds.origin.y + 100;
    }else if (textView.tag == 2){
        frame = self.view.bounds.origin.y + 200;
    }
    if (frame >= 0) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.view.bounds;
            rect.origin.y = frame;
            self.view.bounds = rect;
        }];
    }

    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.view.bounds;
        frame.origin.y = 0.0;
        self.view.bounds = frame;
    }];
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
