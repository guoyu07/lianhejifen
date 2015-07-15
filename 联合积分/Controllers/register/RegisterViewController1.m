//
//  RegisterViewController1.m
//  联合积分
//
//  Created by arong on 15/7/14.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "RegisterViewController1.h"
#import "RegisterViewController2.h"

@interface RegisterViewController1 ()
{
    UITextField  *_cardTexdField;
}
@end

@implementation RegisterViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createNav];
    [self configUI];
}

- (void)createNav {
    UIButton *backButton = [GZRControl createButtonWithFrame:CGRectMake(20, 30, 30, 30) ImageName:@"u532.png" Target:self Action:@selector(backButtonClicked) Title:nil titleColor:nil backColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:backButton];
    
    UILabel *titleLabel = [GZRControl createLabelWithFrame:CGRectMake(70, 35, 120, 20) Font:17 Text:@"登录银行卡" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [self.view addSubview:titleLabel];
}

- (void)backButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configUI {
    UILabel *cardLabel = [GZRControl createLabelWithFrame:CGRectMake(30, 114, 30, 20) Font:15 Text:@"卡号" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
    [self.view addSubview:cardLabel];
    
    UIButton *cameraButton = [GZRControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH-60, 104, 30, 30) ImageName:@"camera" Target:self Action:@selector(cameraButtonClicked) Title:nil titleColor:nil backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
    [self.view addSubview:cameraButton];
    
    _cardTexdField = [GZRControl createTextFieldWithFrame:CGRectMake(70, 104, SCREEN_WIDTH-140, 40) placeholder:@"请输入银行卡号" password:NO leftImageView:nil rightImageView:nil Font:17];
    _cardTexdField.keyboardType = UIKeyboardTypeNumberPad;
    _cardTexdField.keyboardType = UIKeyboardAppearanceLight;
    [self.view addSubview:_cardTexdField];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 144, SCREEN_WIDTH-60, 1)];
    [lineLabel setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:lineLabel];
    
    UIButton *nextButton = [GZRControl createButtonWithFrame:CGRectMake(30, CGRectGetMaxY(lineLabel.frame)+20, SCREEN_WIDTH-60, 50) ImageName:nil Target:self Action:@selector(nextButtonClicked) Title:@"继 续" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:5 masks:YES];
    [self.view addSubview:nextButton];
}

- (void)cameraButtonClicked {
    
}

- (void)nextButtonClicked {
    RegisterViewController2 *VC = [[RegisterViewController2 alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_cardTexdField resignFirstResponder];
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
