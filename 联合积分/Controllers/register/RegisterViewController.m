//
//  RegisterViewController.m
//  联合积分
//
//  Created by arong on 15/7/3.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterViewController1.h"

@interface RegisterViewController ()
{
    UITextField *_userTextField;
    UITextField *_verifyTextField;
    UIButton    *_sendButton;
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    
    [self createNav];
    [self configUI];
}

- (void)createNav {
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 49)];
    [navView setBackgroundColor:RGBCOLOR(228, 35, 117)];
    [self.view addSubview:navView];
    
    UIButton *backBtn = [GZRControl createButtonWithFrame:CGRectMake(5, 10, 30, 30) ImageName:@"u257" Target:self Action:@selector(backBtnClicked) Title:nil titleColor:nil backColor:nil cornerRadius:0 masks:NO];
    [navView addSubview:backBtn];
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake((SCREEN_WIDTH-80)/2, 0, 80, 49) Font:17 Text:@"注 册" TextColor:[UIColor whiteColor] TextAligent:NSTextAlignmentLeft];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [navView addSubview:titleLabel];
    
}

- (void)backBtnClicked {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)configUI {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 50)];
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 50)];
    
    _userTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, (SCREEN_HEIGHT-69)/5, SCREEN_WIDTH-40, 50)];
    _userTextField.placeholder = @"请输入手机号吗！";
    _userTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    _userTextField.layer.borderWidth = 1;
    _userTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _userTextField.leftView = view;
    _userTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_userTextField];
    
    _verifyTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_userTextField.frame)+10, (SCREEN_WIDTH-40)/2, 50)];
    _verifyTextField.placeholder = @"获取短信验证码";
    _verifyTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    _verifyTextField.layer.borderWidth = 1;
    _verifyTextField.keyboardType = UIKeyboardTypeNumberPad;
    _verifyTextField.leftView = view1;
    _verifyTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_verifyTextField];
    
    _sendButton = [GZRControl createButtonWithFrame:CGRectMake(CGRectGetMaxX(_verifyTextField.frame)+5, CGRectGetMaxY(_userTextField.frame)+10, (SCREEN_WIDTH-40)/2-5, 50) ImageName:nil Target:self Action:@selector(sendButtonClicked) Title:@"发 送" titleColor:[UIColor brownColor] backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
    [_sendButton setTitleColor:RGBCOLOR(228, 35, 117) forState:UIControlStateHighlighted];
    [self.view addSubview:_sendButton];
    
    UIButton *goButton = [GZRControl createButtonWithFrame:CGRectMake(20, CGRectGetMaxY(_verifyTextField.frame)+10, SCREEN_WIDTH-40, 50) ImageName:nil Target:self Action:@selector(goButtonClicked) Title:@"继 续" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:0 masks:NO];
    [self.view addSubview:goButton];
    
    UILabel *questionLabel = [GZRControl createLabelWithFrame:CGRectMake((SCREEN_WIDTH-180)/2, CGRectGetMaxY(goButton.frame)+30, 90, 30) Font:17 Text:@"已有账号？" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentCenter];
    [self.view addSubview:questionLabel];
    
    UIButton *loginButton = [GZRControl createButtonWithFrame:CGRectMake(CGRectGetMaxX(questionLabel.frame), CGRectGetMaxY(goButton.frame)+30, 90, 30) ImageName:nil Target:self Action:@selector(loginButtonClicked) Title:@"直接登录" titleColor:[UIColor brownColor] backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
    [loginButton setTitleColor:RGBCOLOR(228, 35, 117) forState:UIControlStateHighlighted];
    [self.view addSubview:loginButton];
    
    UILabel *explainLabel = [GZRControl createLabelWithFrame:CGRectMake(20, SCREEN_HEIGHT-30, 200, 20) Font:15 Text:@"点击继续表示您同意联合积分" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentCenter];
    [self.view addSubview:explainLabel];
    
    UIButton *negButton = [GZRControl createButtonWithFrame:CGRectMake(CGRectGetMaxX(explainLabel.frame), SCREEN_HEIGHT-30, 80, 20) ImageName:nil Target:self Action:@selector(negButtonClicked) Title:@"隐私协议" titleColor:[UIColor blueColor] backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
    [negButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self.view addSubview:negButton];
}

/**
 *  发送手机号并且给该手机号发送验证码
 */
- (void)sendButtonClicked {
    [_sendButton setTitle:@"重新发送" forState:UIControlStateNormal];
}

/**
 *  跳转到下一个完善信息页面
 */
- (void)goButtonClicked {
    RegisterViewController1 *VC = [[RegisterViewController1 alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

/**
 *  跳转到登录页面
 */
- (void)loginButtonClicked {
    
}
/**
 *  显示隐藏协议
 */
- (void)negButtonClicked {
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_userTextField resignFirstResponder];
    [_verifyTextField resignFirstResponder];
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
