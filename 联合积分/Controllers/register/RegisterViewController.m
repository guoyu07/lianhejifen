//
//  RegisterViewController.m
//  联合积分
//
//  Created by arong on 15/7/14.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterViewController1.h"
#import "LoginViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    
    [self configUI];
}

- (void)configUI {
    UIImageView *headImageView = [GZRControl createImageViewWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 100, 100, 100) ImageName:@"head.png"];
    [self.view addSubview:headImageView];
    
    NSArray *titleArr = [NSArray arrayWithObjects:@"招商银行信用卡",@"天猫",@"国航知音卡",@"其他",@"已有爱积分账号？直接", nil];
    NSArray *imageArr = [NSArray arrayWithObjects:@"u820.png",@"u233.png",@"u221.png", nil];
    for (int i=0; i<5; i++) {
        if (i<3) {
            UIImageView *flagImageView = [GZRControl createImageViewWithFrame:CGRectMake(SCREEN_WIDTH/3, CGRectGetMaxY(headImageView.frame)+80+i*70, 30, 30) ImageName:[imageArr objectAtIndex:i]];
            [self.view addSubview:flagImageView];

        }
        
        UILabel *nameLabel = [GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH/3+40, CGRectGetMaxY(headImageView.frame)+85+i*70, 120, 20) Font:17 Text:[titleArr objectAtIndex:i] TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
        nameLabel.userInteractionEnabled = YES;
        nameLabel.numberOfLines = 1;
        nameLabel.tag = 111 + i;
        if (i==3) {
            [nameLabel setTextColor:RGBCOLOR(228, 35, 117)];
        }
        if (i==4) {
            [nameLabel setFrame:CGRectMake((SCREEN_WIDTH-200)/2, CGRectGetMaxY(headImageView.frame)+85+i*70, 200, 20)];
            [nameLabel setTextAlignment:NSTextAlignmentRight];
        }
        [self.view addSubview:nameLabel];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClicked:)];
        [nameLabel addGestureRecognizer:tap];
        
        if (i<4) {
            UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(headImageView.frame)+80+50+i*70, SCREEN_WIDTH-40, 0.5)];
            lineLabel.backgroundColor = [UIColor lightGrayColor];
            [self.view addSubview:lineLabel];
        }
    }
    
    UIButton *loginBtn = [GZRControl createButtonWithFrame:CGRectMake((SCREEN_WIDTH-200)/2+200, 200+85+280, 40, 20) ImageName:nil Target:self Action:@selector(loginBtnClicked) Title:@"登录" titleColor:RGBCOLOR(228, 35, 117) backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
    [self.view addSubview:loginBtn];
}

- (void)tapClicked:(UITapGestureRecognizer *)tap {
    RegisterViewController1 *VC = [[RegisterViewController1 alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
    logdebug(@"执行手势操作!!!");
}

- (void)loginBtnClicked {
    LoginViewController *login = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:login animated:YES];
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
