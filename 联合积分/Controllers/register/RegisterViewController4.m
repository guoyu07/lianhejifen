//
//  RegisterViewController4.m
//  联合积分
//
//  Created by arong on 15/7/14.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "RegisterViewController4.h"
#import "RootViewController.h"

@interface RegisterViewController4 ()

@end

@implementation RegisterViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createNav];
    [self configUI];
}

- (void)createNav {
    UIButton *backButton = [GZRControl createButtonWithFrame:CGRectMake(20, 30, 30, 30) ImageName:@"u532.png" Target:self Action:@selector(backButtonClicked) Title:nil titleColor:nil backColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:backButton];
    
    UILabel *titleLabel = [GZRControl createLabelWithFrame:CGRectMake(70, 35, 120, 20) Font:17 Text:@"添加成功" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [self.view addSubview:titleLabel];
}

- (void)backButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configUI {
    
    /************创建已经成功添加的账号信息显示视图**************/
    UIImageView *firstImageView = [GZRControl createImageViewWithFrame:CGRectMake(10, 84, SCREEN_WIDTH-20, 150) ImageName:@"u88"];
    firstImageView.layer.cornerRadius = 10;
    firstImageView.layer.masksToBounds = YES;
    firstImageView.userInteractionEnabled = YES;
    [self.view addSubview:firstImageView];
    
    UIImageView *headImageView = [GZRControl createImageViewWithFrame:CGRectMake(20, 20, 30, 30) ImageName:@"u820"];
    [firstImageView addSubview:headImageView];
    
    UILabel *nameLabel = [GZRControl createLabelWithFrame:CGRectMake(60, 25, 100, 20) Font:15 Text:@"招商银行 1129" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [firstImageView addSubview:nameLabel];
    
    UILabel *sourceLabel = [GZRControl createLabelWithFrame:CGRectMake(firstImageView.frame.size.width-110, 25, 80, 20) Font:15 Text:@"3220积分" TextColor:RGBCOLOR(228, 35, 117) TextAligent:NSTextAlignmentRight];
    [firstImageView addSubview:sourceLabel];
    
    UIButton *startButton = [GZRControl createButtonWithFrame:CGRectMake(50, firstImageView.frame.size.height-70, firstImageView.frame.size.width-100, 50) ImageName:nil Target:self Action:@selector(startButtonClicked) Title:@"开始兑换积分" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:5 masks:YES];
    [firstImageView addSubview:startButton];
    
    /*************创建关联账号视图***************/
    UIImageView *imageView = [GZRControl createImageViewWithFrame:CGRectMake(20, CGRectGetMaxY(firstImageView.frame)+20, 30, 30) ImageName:@"bingou"];
    [self.view addSubview:imageView];
    
    UILabel *desLabel = [GZRControl createLabelWithFrame:CGRectMake(60, CGRectGetMaxY(firstImageView.frame)+25, SCREEN_WIDTH-80, 20) Font:15 Text:@"添加我的其他账号（根据手机号检测）" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
    [self.view addSubview:desLabel];
    
    UIImageView *secondImageView = [GZRControl createImageViewWithFrame:CGRectMake(10, CGRectGetMaxY(firstImageView.frame)+60, SCREEN_WIDTH-20, 80) ImageName:@"u88"];
    [self.view addSubview:secondImageView];
    
    UIImageView *headImageView1 = [GZRControl createImageViewWithFrame:CGRectMake(20, 25, 30, 30) ImageName:@"u221"];
    [secondImageView addSubview:headImageView1];
    
    UILabel *nameLabel1 = [GZRControl createLabelWithFrame:CGRectMake(60, 30, 80, 20) Font:15 Text:@"国航知音卡" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [secondImageView addSubview:nameLabel1];
    
    UILabel *sourceLabel1 = [GZRControl createLabelWithFrame:CGRectMake(secondImageView.frame.size.width-100, 30, 80, 20) Font:15 Text:@"19820积分" TextColor:RGBCOLOR(228, 35, 117) TextAligent:NSTextAlignmentLeft];
    [secondImageView addSubview:sourceLabel1];
    
    /***********创建其他选项************/
    UILabel *title = [GZRControl createLabelWithFrame:CGRectMake((SCREEN_WIDTH-150)/2, CGRectGetMaxY(secondImageView.frame)+20, 150, 20) Font:15 Text:@"继续添加其他账号" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
    [self.view addSubview:title];
    
    for (int i=0; i<2; i++) {
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(title.frame)+10+50*i, SCREEN_WIDTH-40, 0.5)];
        lineLabel.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:lineLabel];
    }
    
    UIImageView *headImageView2 = [GZRControl createImageViewWithFrame:CGRectMake((SCREEN_WIDTH-70)/2, CGRectGetMaxY(title.frame)+20, 30, 30) ImageName:@"u233"];
    [self.view addSubview:headImageView2];
    
    UILabel *nameLabel2 = [GZRControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(headImageView2.frame)+5, CGRectGetMaxY(title.frame)+25, 30, 20) Font:15 Text:@"天猫" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [self.view addSubview:nameLabel2];
    
    UIButton *otherButton = [GZRControl createButtonWithFrame:CGRectMake((SCREEN_WIDTH-30)/2, CGRectGetMaxY(headImageView2.frame)+20, 30, 20) ImageName:nil Target:self Action:@selector(otherButtonClicked) Title:@"其他" titleColor:RGBCOLOR(228, 35, 117) backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
    otherButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:otherButton];
}

- (void)startButtonClicked {
    RootViewController *VC = [[RootViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)otherButtonClicked {
    
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
