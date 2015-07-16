//
//  VerifyViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/14.
//  Copyright (c) 2015年 arong. All rights reserved.
//验证手机号视图控制器

#import "VerifyViewController.h"
#import "BoundViewController.h"
@interface VerifyViewController ()

@end

@implementation VerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self createNa];
    
    [self createUI];
   
}

-(void)createNa
{
    
    UIView *naView =[[UIView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH,49 )];
    
    naView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:naView];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(10, 10, 30, 30)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"u532"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [naView addSubview:leftButton];
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH/6-10, 0, SCREEN_WIDTH-SCREEN_WIDTH/6, 49) Font:17 Text:@"添加银行卡" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    
    [naView addSubview:titleLabel];
    
}


-(void)createUI
{
    UITextField *cardNum =[[UITextField alloc]initWithFrame:CGRectMake(20, 120, SCREEN_WIDTH-120, 40)];
    cardNum.placeholder = @"验证码"; //默认显示的字
    
    cardNum.keyboardType =UIKeyboardTypeNumberPad;
    [self.view addSubview:cardNum];
    
    UIButton *verifyButton =[GZRControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH-100, 120, 80, 30) ImageName:@"" Target:self Action:@selector(verifyButtonClick:) Title:@"发送验证码" titleColor:[UIColor blackColor] backColor:[UIColor whiteColor]cornerRadius:0 masks:YES];
    verifyButton.layer.borderWidth =1.0;
    verifyButton.titleLabel.font =[UIFont systemFontOfSize:15];
    [self.view addSubview: verifyButton];
    
    UIButton *addButton =[GZRControl createButtonWithFrame:CGRectMake(30, 170, SCREEN_WIDTH-60, 60) ImageName:@"" Target:self Action:@selector(addButtonClick:) Title:@"继续" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:1 masks:YES];
    [self.view addSubview:addButton];
    
}

-(void)verifyButtonClick:(UIButton *)btn
{
    logdebug(@"发送验证码");
    
}
-(void)addButtonClick:(UIButton *)btn
{
    BoundViewController *bound =[[BoundViewController alloc]init];
    
    [self.navigationController pushViewController:bound animated:YES];
    
    
    
}
-(void)leftButtonClick:(UIButton *)btn
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
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
