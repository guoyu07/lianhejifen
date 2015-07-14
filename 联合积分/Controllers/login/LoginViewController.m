//
//  LoginViewController.m
//  联合积分
//
//  Created by arong on 15/7/14.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "LoginViewController.h"
#import "RootViewController.h"

@interface LoginViewController ()
{
    UITextField *_nameTextField;
    UITextField *_passWordTextField;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    UILabel *titleLabel = [GZRControl createLabelWithFrame:CGRectMake(35, 15, SCREEN_WIDTH-35, 20) Font:17 Text:@"登录" TextColor:[UIColor whiteColor] TextAligent:NSTextAlignmentLeft];
    titleLabel.numberOfLines = 1;
    [navView addSubview:titleLabel];
}

- (void)backBtnClicked {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)configUI {
    _nameTextField = [GZRControl createTextFieldWithFrame:CGRectMake(25, 69+50, SCREEN_WIDTH-50, 40) placeholder:@"请输入手机号" password:NO leftImageView:nil rightImageView:nil Font:15];
    _nameTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_nameTextField];
    
    _passWordTextField = [GZRControl createTextFieldWithFrame:CGRectMake(25, 69+50+50, SCREEN_WIDTH-50, 40) placeholder:@"请输入密码" password:YES leftImageView:nil rightImageView:nil Font:15];
    [self.view addSubview:_passWordTextField];
    
    for (int i=0; i<2; i++) {
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 69+50+40+50*i, SCREEN_WIDTH-40, 0.5)];
        lineLabel.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:lineLabel];
    }
    
    UIButton *loginButton = [GZRControl createButtonWithFrame:CGRectMake(20, CGRectGetMaxY(_passWordTextField.frame)+20, SCREEN_WIDTH-40, 50) ImageName:nil Target:self Action:@selector(loginButtonClicked) Title:@"登 录" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:5 masks:YES];
    [self.view addSubview:loginButton];
}

- (void)loginButtonClicked {
    RootViewController *VC = [[RootViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_nameTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
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
