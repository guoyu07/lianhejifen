//
//  RegisterViewController2.m
//  联合积分
//
//  Created by arong on 15/7/14.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "RegisterViewController2.h"
#import "RegisterViewController3.h"

@interface RegisterViewController2 ()
{
    UITextField *_phoneTextField;
    UITextField *_verifyTextField;
}
@end

@implementation RegisterViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createNav];
    [self configUI];
}

- (void)createNav {
    UIButton *backButton = [GZRControl createButtonWithFrame:CGRectMake(20, 30, 30, 30) ImageName:@"u532.png" Target:self Action:@selector(backButtonClicked) Title:nil titleColor:nil backColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:backButton];
    
    UILabel *titleLabel = [GZRControl createLabelWithFrame:CGRectMake(70, 35, 120, 20) Font:17 Text:@"验证手机号" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [self.view addSubview:titleLabel];
}

- (void)backButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)configUI {
    _phoneTextField = [GZRControl createTextFieldWithFrame:CGRectMake(35, 104, SCREEN_WIDTH-65, 40) placeholder:@"填写预留的手机号" password:NO leftImageView:nil rightImageView:nil Font:15];
    [self.view addSubview:_phoneTextField];
    
    _verifyTextField = [GZRControl createTextFieldWithFrame:CGRectMake(35, 149, SCREEN_WIDTH-65-100, 40) placeholder:@"点击获取验证码" password:NO leftImageView:nil rightImageView:nil Font:15];
    [self.view addSubview:_verifyTextField];
    
    for (int i=0; i<2; i++) {
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 144+45*i, SCREEN_WIDTH-60, 0.5)];
        [lineLabel setBackgroundColor:[UIColor lightGrayColor]];
        [self.view addSubview:lineLabel];
    }
    
    UIButton *verifyBtn = [GZRControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH-120, 149, 80, 40) ImageName:nil Target:self Action:@selector(verifyBtnClicked) Title:@"发 送" titleColor:RGBCOLOR(228, 35, 117) backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
    [self.view addSubview:verifyBtn];
    
    UIButton *nextButton = [GZRControl createButtonWithFrame:CGRectMake(30, 209, SCREEN_WIDTH-60, 50) ImageName:nil Target:self Action:@selector(nextButtonClicked) Title:@"继 续" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:5 masks:YES];
    [self.view addSubview:nextButton];
}

- (void)verifyBtnClicked {
    
}

- (void)nextButtonClicked {
    RegisterViewController3 *VC = [[RegisterViewController3 alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_phoneTextField resignFirstResponder];
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
