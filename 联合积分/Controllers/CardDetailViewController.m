//
//  CardDetailViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/2.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "CardDetailViewController.h"

@interface CardDetailViewController ()

@end

@implementation CardDetailViewController
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
    UITextField *cardNum =[[UITextField alloc]initWithFrame:CGRectMake(20, 120, SCREEN_WIDTH-80, 40)];
    cardNum.placeholder = @"卡号"; //默认显示的字

    cardNum.keyboardType =UIKeyboardTypeNumberPad;
    [self.view addSubview:cardNum];
    
    UIImageView *iconImageView =[[UIImageView  alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60, 120, 40, 40)];
    iconImageView.backgroundColor =RGBCOLOR(228, 35, 117);
    iconImageView.image =[UIImage imageNamed:@""];
    
    [self.view addSubview:iconImageView];
    UIButton *addButton =[GZRControl createButtonWithFrame:CGRectMake(30, 170, SCREEN_WIDTH-60, 60) ImageName:@"" Target:self Action:@selector(addButtonClick:) Title:@"继续" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:1 masks:YES];
    [self.view addSubview:addButton];
    
}
-(void)addButtonClick:(UIButton *)btn
{

    
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
