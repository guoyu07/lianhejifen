//
//  FinancialViewController.m
//  联合积分
//
//  Created by arong on 15/7/2.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "FinancialViewController.h"

@interface FinancialViewController ()

@end

@implementation FinancialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *bgView = [GZRControl viewWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT-69) bgColor:RGBCOLOR(235, 235, 235) cornerRadius:0 masks:NO];
    [self.view addSubview:bgView];
    
    [self createNav];
    [self createContentView];
}

- (void)createNav {
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 49)];
    [navView setBackgroundColor:RGBCOLOR(228, 35, 117)];
    [self.view addSubview:navView];
    
    UIButton *backBtn = [GZRControl createButtonWithFrame:CGRectMake(5, 10, 30, 30) ImageName:@"u257" Target:self Action:@selector(backBtnClicked) Title:nil titleColor:nil backColor:nil cornerRadius:0 masks:NO];
    [navView addSubview:backBtn];
    
    UILabel *titleLabel = [GZRControl createLabelWithFrame:CGRectMake(35, 15, SCREEN_WIDTH-35, 20) Font:17 Text:self.titleName TextColor:[UIColor whiteColor] TextAligent:NSTextAlignmentLeft];
    [navView addSubview:titleLabel];
}

- (void)backBtnClicked {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
/**
 *  创建内容显示视图
 */
- (void)createContentView {
    UIView *bgView1 = [GZRControl viewWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, (SCREEN_HEIGHT-69-49-10)*2/5) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:bgView1];
    
    UIView *bgView2 = [GZRControl viewWithFrame:CGRectMake(0, CGRectGetMaxY(bgView1.frame)+10, SCREEN_WIDTH, (SCREEN_HEIGHT-69-49-10)*3/5) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:bgView2];
    
    UIButton *buyBtn = [GZRControl createButtonWithFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49) ImageName:nil Target:self Action:@selector(buyBtnClicked) Title:@"购买" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:0 masks:NO];
    [self.view addSubview:buyBtn];
}

- (void)buyBtnClicked {
    logdebug(@"确认购买响应!!!");
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
