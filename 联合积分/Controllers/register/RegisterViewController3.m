//
//  RegisterViewController3.m
//  联合积分
//
//  Created by arong on 15/7/14.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "RegisterViewController3.h"
#import "RegisterViewController4.h"

@interface RegisterViewController3 ()
{
    UITextField *_passwordTextField;
}
@end

@implementation RegisterViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createNav];
    [self configUI];
}

- (void)createNav {
    UIButton *backButton = [GZRControl createButtonWithFrame:CGRectMake(20, 30, 30, 30) ImageName:@"u532.png" Target:self Action:@selector(backButtonClicked) Title:nil titleColor:nil backColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:backButton];
    
    UILabel *titleLabel = [GZRControl createLabelWithFrame:CGRectMake(70, 35, 120, 20) Font:17 Text:@"设置密码" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [self.view addSubview:titleLabel];
}

- (void)backButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configUI {
    UILabel *remindLabel = [GZRControl createLabelWithFrame:CGRectMake(30, 104, SCREEN_WIDTH-60, 20) Font:15 Text:@"下次可用手机号和密码登陆爱积分账号" TextColor:[UIColor lightGrayColor] TextAligent:NSTextAlignmentLeft];
    [self.view addSubview:remindLabel];
    
    _passwordTextField = [GZRControl createTextFieldWithFrame:CGRectMake(35, 164, SCREEN_WIDTH-65, 40) placeholder:@"请输入数字和字母组合的密码" password:YES leftImageView:nil rightImageView:nil Font:15];
    [self.view addSubview:_passwordTextField];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 204, SCREEN_WIDTH-65, 0.5)];
    [lineLabel setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:lineLabel];
    
    UIButton *nextButton = [GZRControl createButtonWithFrame:CGRectMake(30, 224, SCREEN_WIDTH-60, 50) ImageName:nil Target:self Action:@selector(nextButtonClicked) Title:@"继 续" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:5 masks:YES];
    [self.view addSubview:nextButton];
}

- (void)nextButtonClicked {
    RegisterViewController4 *VC = [[RegisterViewController4 alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
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
