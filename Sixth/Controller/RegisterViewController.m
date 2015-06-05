//
//  RegisterViewController.m
//  Sixth
//
//  Created by 曹凯 on 15/5/27.
//  Copyright (c) 2015年 CK. All rights reserved.
//

#import "RegisterViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *rePassword;
@property (weak, nonatomic) IBOutlet UIButton *finishBt;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    // 添加点击事件
    [self.finishBt addTarget:self action:@selector(finishBtAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)finishBtAction{
    if ([self.password.text isEqualToString:self.rePassword.text]) {
        AVObject *object = [AVObject objectWithClassName:@"UserInfo"];
        [object setObject:self.userName.text forKey:@"userName"];
        [object setObject:self.password.text forKey:@"password"];
        [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            NSString *msg=nil;
            if (succeeded) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注册结果" message:@"创建成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                [alert show];
                msg=[NSString stringWithFormat:@"创建成功: %@",[object description]];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注册结果" message:@"创建成功" delegate:self cancelButtonTitle:@"重新注册" otherButtonTitles:@"确定", nil];
                [alert show];
                msg=[NSString stringWithFormat:@"创建失败: %@",[error description]];
            }
            NSLog(@"%@",msg);
        }];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注册结果" message:@"创建成功" delegate:self cancelButtonTitle:@"重新注册" otherButtonTitles:@"确定", nil];
        [alert show];

        NSLog(@"创建失败:%@",self.userName.text);
    }
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
