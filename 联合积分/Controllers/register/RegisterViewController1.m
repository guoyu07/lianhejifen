//
//  RegisterViewController1.m
//  联合积分
//
//  Created by arong on 15/7/3.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "RegisterViewController1.h"

@interface RegisterViewController1 ()
{
    UITextField *_passwordTextField;
}
@end

@implementation RegisterViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createNav];
    [self configUI];
}

- (void)createNav {
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 49)];
    [navView setBackgroundColor:RGBCOLOR(228, 35, 117)];
    [self.view addSubview:navView];
    
    UIButton *backBtn = [GZRControl createButtonWithFrame:CGRectMake(5, 10, 30, 30) ImageName:@"u257" Target:self Action:@selector(backBtnClicked) Title:nil titleColor:nil backColor:nil cornerRadius:0 masks:NO];
    [navView addSubview:backBtn];
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake((SCREEN_WIDTH-80)/2, 0, 80, 49) Font:17 Text:@"设置密码" TextColor:[UIColor whiteColor] TextAligent:NSTextAlignmentLeft];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [navView addSubview:titleLabel];
    
}

- (void)backBtnClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configUI {
    UILabel *tipLabel = [GZRControl createLabelWithFrame:CGRectMake(20, 69+30, SCREEN_WIDTH-40, 20) Font:15 Text:@"下次可用手机号和密码登录联合积分" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
    [self.view addSubview:tipLabel];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 50)];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 69+70, SCREEN_WIDTH-40, 50)];
    _passwordTextField.placeholder = @"输入字母和数字组合的密码";
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    _passwordTextField.layer.borderWidth = 1;
    _passwordTextField.leftView = view;
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_passwordTextField];
    
    UIButton *confirmButton = [GZRControl createButtonWithFrame:CGRectMake(20, 69+70+70, SCREEN_WIDTH-40, 50) ImageName:nil Target:self Action:@selector(confirmButtonClicked) Title:@"确 定" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:0 masks:NO];
    [self.view addSubview:confirmButton];
}

/**
 *  确认并提交密码到服务器
 */
- (void)confirmButtonClicked {
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_passwordTextField resignFirstResponder];
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
