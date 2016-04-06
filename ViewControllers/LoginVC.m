//
//  LoginVC.m
//  hlJXT
//
//  Created by Jier on 16/3/21.
//  Copyright © 2016年 Jier. All rights reserved.
//

#import "LoginVC.h"
#import "School.h"
#import "Message.h"
#import "Friends.h"
#import "My.h"
#import "MBProgressHUD+MJ.h"
#import "SingletonRequest.h"
#import "LoginModal.h"
@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    [_userNameTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_passwordTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];


    if ([NSUserDefaults standardUserDefaults]) {
        self.userNameTF.text = [[NSUserDefaults standardUserDefaults]valueForKey:@"username"];
        self.passwordTF.text = [[NSUserDefaults standardUserDefaults]valueForKey:@"password"];
    }
    
    UITapGestureRecognizer* singleRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidKeyboard)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:singleRecognizer];
}

-(void)hidKeyboard
{
    [self.userNameTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.userNameTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}
- (IBAction)LoginBtn:(id)sender {
    
    [MBProgressHUD showMessage:@"登录中"];
    
    NSString *body=[NSString stringWithFormat:@"cusername=%@&cpassword=%@",self.userNameTF.text,self.passwordTF.text];
    id data =[SingletonRequest returnedDataWithRequest:[SingletonRequest requestwithURl:LoginURL withBody:body withRequestMethod:@"POST"]];
    [MBProgressHUD hideHUD];
    if ([data isKindOfClass:[NSNull class]]) {
        [MBProgressHUD showError:@"网络错误"];
    }
    else{
        if ([[data valueForKey:@"T"]isEqualToString:@"F"]) {
            [MBProgressHUD showError:@"用户名或密码错误"];
        }else if([[data valueForKey:@"T"]isEqualToString:@"S"])
        {
            [MBProgressHUD showSuccess:@"登陆成功"];
            
                [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:self.userNameTF.text password:self.passwordTF.text completion:^(NSDictionary *loginInfo, EMError *error) {
                    if (!error) {
                        NSLog(@"用户信息:%@",loginInfo);
                        //成功的话  跳转到用户环信界面
                        [MBProgressHUD showSuccess:@"登陆成功"];
                        [[EaseMob sharedInstance].chatManager loadDataFromDatabase];
                        //从数据库获取数据
                    }
                    else
                    {
                        [MBProgressHUD showError:@"密码错误"];
                    }
                } onQueue:nil];
            
            [self LoadSuccess];
            LoginModal *loginmodal = [LoginModal grobleLoginModal];
            loginmodal.sessionID = [data valueForKey:@"sessionID"];
            loginmodal.role = [data valueForKey:@"userRole"];
            loginmodal.userID = [data valueForKey:@"userid"];
            loginmodal.userName = [data valueForKey:@"realName"];
            
        }
    }

}

-(void)LoadSuccess
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:self.userNameTF.text forKey:@"username"];
    [defaults setValue:self.passwordTF.text forKey:@"password"];
    
    UITabBarController *tabbar=[[UITabBarController alloc]init];
    School *school=[[School alloc]init];
    school.tabBarItem.image=[UIImage imageNamed:@"icon_school@2x.png"];
    school.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_school_selected@2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    school.tabBarItem.title=@"学校";
    UINavigationController *vv1=[[UINavigationController alloc]initWithRootViewController:school];
    
    Friends *friends=[[Friends alloc]init];
    friends.tabBarItem.image=[UIImage imageNamed:@"icon_discovery@2x.png"];
    friends.tabBarItem.selectedImage =[[UIImage imageNamed:@"icon_discovery_selected@2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    friends.tabBarItem.title=@"发现";
    UINavigationController *vv2=[[UINavigationController alloc]initWithRootViewController:friends];
    
    Message *message=[[Message alloc]init];
    message.tabBarItem.image=[UIImage imageNamed:@"icon_notes@2x.png"];
    message.tabBarItem.selectedImage=[[UIImage imageNamed:@"icon_notes_selected@2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    message.tabBarItem.title=@"消息";
    UINavigationController *vv3=[[UINavigationController alloc]initWithRootViewController:message];
    
    My *my=[[My alloc]init];
    my.tabBarItem.image=[UIImage imageNamed:@"icon_self@2x.png"];
    my.tabBarItem.selectedImage=[[UIImage imageNamed:@"icon_self_selcted@2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    my.tabBarItem.title=@"我的";
    UINavigationController *vv4=[[UINavigationController alloc]initWithRootViewController:my];
    
    NSArray *vcs=[NSArray arrayWithObjects:vv1,vv2,vv3,vv4, nil];
    tabbar.viewControllers=vcs;
      tabbar.tabBar.backgroundImage = [UIImage imageNamed:@"bg_text@2x.png"];
//    tabbar.tabBar.backgroundColor = [UIColor whiteColor];
    tabbar.hidesBottomBarWhenPushed=YES;
    tabbar.tabBar.barTintColor=MainColor;
//    tabbar.tabBar.tintColor=[UIColor blueColor];
    [self presentViewController:tabbar animated:NO completion:NULL];
}



@end
