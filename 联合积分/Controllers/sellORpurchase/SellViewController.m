//
//  SellViewController.m
//  联合积分
//
//  Created by arong on 15/7/1.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "SellViewController.h"

@interface SellViewController ()
{
    UILabel *_sourceLabel;  // 用来实时显示分值的label
    UILabel *_moneyLabe;    // 用来实时显示对应钱数的label
}
@end

@implementation SellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(70, 0, 120, 49) Font:25 Text:@"卖出积分" TextColor:[UIColor whiteColor] TextAligent:NSTextAlignmentLeft];
    
    [navView addSubview:titleLabel];

    
}


- (void)backBtnClicked {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)configUI {
    UIView *bgView = [GZRControl viewWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT) bgColor:RGBCOLOR(235, 235, 235) cornerRadius:0 masks:NO];
    [self.view addSubview:bgView];
    
    UIView *bgView1 =[GZRControl viewWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, (SCREEN_HEIGHT-69-20)*2/7) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:bgView1];
    
    UIView *bgView2 = [GZRControl viewWithFrame:CGRectMake(0, CGRectGetMaxY(bgView1.frame)+10, SCREEN_WIDTH, (SCREEN_HEIGHT-69-20)*2/7) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:bgView2];
    
    UIView *bgView3 = [GZRControl viewWithFrame:CGRectMake(0, CGRectGetMaxY(bgView2.frame)+10, SCREEN_WIDTH, (SCREEN_HEIGHT-69-20)*3/7) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:bgView3];
    
    /*********创建账户选择视图************/
    UILabel *accountLabel = [GZRControl createLabelWithFrame:CGRectMake(10, 10, 150, (bgView1.frame.size.height-60)/3) Font:17 Text:@"选择接收账户" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [bgView1 addSubview:accountLabel];
    
    for (int i=0; i<2; i++) {
        UIButton *chooseBtn = [GZRControl createButtonWithFrame:CGRectMake(10, CGRectGetMaxY(accountLabel.frame)+20+(((bgView1.frame.size.height-60)/3+20)*i), 20, 20) ImageName:@"u611" Target:self Action:@selector(chooseBtnClicked:) Title:nil titleColor:nil backColor:nil cornerRadius:0 masks:NO];
        chooseBtn.tag = 111 + i;
        [bgView1 addSubview:chooseBtn];
        
        UIImageView *flagImageView = [[UIImageView alloc] init];
        UILabel *nameLabel = [[UILabel alloc] init];
        [nameLabel setFont:[UIFont systemFontOfSize:13]];
        [nameLabel setTextColor:[UIColor lightGrayColor]];
        if (i==0) {
            [flagImageView setFrame:CGRectMake(60, CGRectGetMaxY(accountLabel.frame)+20+(((bgView1.frame.size.height-60)/3+20)*i), 80, (bgView1.frame.size.height-60)/3)];
            [flagImageView setImage:[UIImage imageNamed:@"u615"]];
            
            [nameLabel setFrame:CGRectMake(CGRectGetMaxX(flagImageView.frame)+5, CGRectGetMaxY(accountLabel.frame)+20+(((bgView1.frame.size.height-60)/3+20)*i), 80, 20)];
            [nameLabel setText:@"未绑定"];
            
        } else {
            [flagImageView setFrame:CGRectMake(60, CGRectGetMaxY(accountLabel.frame)+20+(((bgView1.frame.size.height-60)/3+20)*i), 30, 30)];
            [flagImageView setImage:[UIImage imageNamed:@"u617.png"]];
            
            [nameLabel setFrame:CGRectMake(CGRectGetMaxX(flagImageView.frame)+5, CGRectGetMaxY(accountLabel.frame)+20+(((bgView1.frame.size.height-60)/3+20)*i), 80, 20)];
            [nameLabel setText:@"冀拖"];
            
        }
        [bgView1 addSubview:flagImageView];
        [bgView1 addSubview:nameLabel];
    }
    
    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeBtn setFrame:CGRectMake(bgView1.frame.size.width-60, bgView1.frame.size.height-60, 50, 50)];
    [changeBtn setTitle:@"更改" forState:UIControlStateNormal];
    [changeBtn setTitleColor:RGBCOLOR(228, 35, 117) forState:UIControlStateNormal];
    [changeBtn addTarget:self action:@selector(changeBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [bgView1 addSubview:changeBtn];
    
    /**********创建交易额度视图************/
    UILabel *quotaLabel = [GZRControl createLabelWithFrame:CGRectMake(10, 10, 120, (bgView2.frame.size.height-70)/3) Font:17 Text:@"交易额度" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [bgView2 addSubview:quotaLabel];
    
    _sourceLabel = [GZRControl createLabelWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, CGRectGetMaxY(quotaLabel.frame)+20, 90, (bgView2.frame.size.height-70)/3) Font:15 Text:@"10267" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentCenter];
    [bgView2 addSubview:_sourceLabel];
    
    _moneyLabe = [GZRControl createLabelWithFrame:CGRectMake((SCREEN_WIDTH-200)/2+90+20, CGRectGetMaxY(quotaLabel.frame)+20, 90, (bgView2.frame.size.height-70)/3) Font:15 Text:@"￥102.67" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentCenter];
    [bgView2 addSubview:_moneyLabe];
    
    UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_sourceLabel.frame), CGRectGetMaxY(quotaLabel.frame)+20, 20, (bgView2.frame.size.height-70)/3)];
    [arrowImageView setImage:[UIImage imageNamed:@"u639_end"]];
    [bgView2 addSubview:arrowImageView];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_sourceLabel.frame)+20, SCREEN_WIDTH-20, (bgView2.frame.size.height-70)/3)];
    slider.tintColor = RGBCOLOR(228, 35, 117);
    slider.thumbTintColor = RGBCOLOR(228, 35, 117);
    slider.maximumValue = 10267;
    slider.minimumValue = 0;
    slider.value = 10267;
    slider.continuous = YES;
    [slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    [bgView2 addSubview:slider];
    
    /***********创建说明视图*************/
    UILabel *explainLabel = [GZRControl createLabelWithFrame:CGRectMake(10, 10, 50, 30) Font:17 Text:@"说明" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [bgView3 addSubview:explainLabel];
    
    NSArray *contentArray = [NSArray arrayWithObjects:@"1、17:00前交易，当日到账。17:00之后交易，次日到账",@"2、与您交易的是系统为您匹配的出价最高的积分买家",@"3、钱、分兑换比例是系统为您匹配的最高价格", nil];
    for (int i=0; i<3; i++) {
        UILabel *contentLabel = [GZRControl createLabelWithFrame:CGRectMake(10, 45+((bgView3.frame.size.height-100)/3+5)*i, SCREEN_WIDTH-20, (bgView3.frame.size.height-100)/3) Font:14 Text:[contentArray objectAtIndex:i] TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
        contentLabel.numberOfLines = 0;
        [bgView3 addSubview:contentLabel];
    }
    
    NSArray *titleArr = [NSArray arrayWithObjects:@"取消",@"确定兑换", nil];
    for (int i=0; i<2; i++) {
        UIButton *confirmBtn = [GZRControl createButtonWithFrame:CGRectMake((SCREEN_WIDTH/2)*i, SCREEN_HEIGHT-40, SCREEN_WIDTH/2, 40) ImageName:nil Target:self Action:@selector(confirmBtnClicked:) Title:[titleArr objectAtIndex:i] titleColor:[UIColor whiteColor] backColor:[UIColor grayColor] cornerRadius:0 masks:NO];
        if (i==1) {
            confirmBtn.backgroundColor = RGBCOLOR(228, 35, 117);
        }
        [self.view addSubview:confirmBtn];
    }
}

/**
 *  更改收款方式
 *
 *  @param btn 传入点击参数
 */
- (void)chooseBtnClicked:(UIButton *)btn {
    logdebug(@"更改按钮标识，并且更换后台收款账户!");
}
/**
 *  更改收款账号
 */
- (void)changeBtnClicked {
    logdebug(@"弹出可选择窗口!");
}

- (void)sliderValueChange:(UISlider *)slider {
    _sourceLabel.text = [NSString stringWithFormat:@"%.2f",slider.value];
    _moneyLabe.text = [NSString stringWithFormat:@"￥%.2f",slider.value/100];
}

- (void)confirmBtnClicked:(UIButton *)btn {
    logdebug(@"取消或者确认交易!!!");
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
