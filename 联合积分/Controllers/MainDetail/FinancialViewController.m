//
//  FinancialViewController.m
//  联合积分
//
//  Created by arong on 15/7/2.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "FinancialViewController.h"

@interface FinancialViewController ()
{
    UILabel *_changeSourceLabel;    // 记录随时变化的积分数值
    UILabel *_resultSourceLabel;    // 记录积分结果数值
    UILabel *_moneyLabel;           // 记录对应金额数值
}
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
    
    /************创建显示信息***************/
    NSInteger VH1 = bgView1.frame.size.height;
    NSInteger VW1 = bgView1.frame.size.width;
    UILabel *profitLabel = [GZRControl createLabelWithFrame:CGRectMake(20, 20, 80, 20) Font:15 Text:@"预期年化收益" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
    [bgView1 addSubview:profitLabel];
    UILabel *rateLabel = [GZRControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(profitLabel.frame)+10, 20, 80, 20) Font:15 Text:@"10.50%" TextColor:RGBCOLOR(228, 35, 117) TextAligent:NSTextAlignmentLeft];
    [bgView1 addSubview:rateLabel];
    
    NSArray *titleArr = [NSArray arrayWithObjects:@"起息日",@"期限",@"到期日",@"销量", nil];
    NSArray *contentArr = [NSArray arrayWithObjects:@"2015-08-01",@"144天",@"2016-02-02",@"123456人购买", nil];
    for (int i=0; i<titleArr.count; i++) {
        UILabel *titleLabel = [GZRControl createLabelWithFrame:CGRectMake(20+i%2*(10+50+(VW1-150)/2), CGRectGetMaxY(rateLabel.frame)+(VH1-100)/4+i/2*((VH1-100)/4+20), 50, 20) Font:15 Text:[titleArr objectAtIndex:i] TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
        [bgView1 addSubview:titleLabel];
        
        UILabel *contentLabel = [GZRControl createLabelWithFrame:CGRectMake(70+i%2*(10+50+(VW1-150)/2), CGRectGetMaxY(rateLabel.frame)+(VH1-100)/4+i/2*((VH1-100)/4+20), (VW1-150)/2, 20) Font:17 Text:[contentArr objectAtIndex:i] TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
        [bgView1 addSubview:contentLabel];
    }
    
    UIButton *detailBtn = [GZRControl createButtonWithFrame:CGRectMake((SCREEN_WIDTH-80)/2, CGRectGetMaxY(rateLabel.frame)+(VH1-100)/4*3+40, 80, 40) ImageName:nil Target:self Action:@selector(detailBtnClicked) Title:@"查看详情" titleColor:RGBCOLOR(228, 35, 117) backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
    [detailBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [bgView1 addSubview:detailBtn];
    
    /*************创建额度选择视图**************/
    UILabel *qutaLabel = [GZRControl createLabelWithFrame:CGRectMake(20, 50, 40, 20) Font:15 Text:@"额度" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [bgView2 addSubview:qutaLabel];
    
    UILabel *explainLabel = [GZRControl createLabelWithFrame:CGRectMake(20, 110, 70, 20) Font:15 Text:@"预计收益" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [bgView2 addSubview:explainLabel];
    
    _changeSourceLabel = [GZRControl createLabelWithFrame:CGRectMake(70, 20, 100, 20) Font:15 Text:@"15000积分" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [bgView2 addSubview:_changeSourceLabel];
    
    _resultSourceLabel = [GZRControl createLabelWithFrame:CGRectMake(100, 110, 100, 20) Font:15 Text:@"15000积分" TextColor:RGBCOLOR(228, 35, 117) TextAligent:NSTextAlignmentCenter];
    [bgView2 addSubview:_resultSourceLabel];
    
    UILabel *equalLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_resultSourceLabel.frame), 110, 20, 20)];
    equalLabel.text = @"=";
    [bgView2 addSubview:equalLabel];
    
    _moneyLabel = [GZRControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(equalLabel.frame), 110, 80, 20) Font:15 Text:@"150元" TextColor:RGBCOLOR(228, 35, 117) TextAligent:NSTextAlignmentLeft];
    [bgView2 addSubview:_moneyLabel];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(70, 50, SCREEN_WIDTH-90, 20)];
    slider.tintColor = RGBCOLOR(228, 35, 117);
    slider.thumbTintColor = RGBCOLOR(228, 35, 117);
    slider.maximumValue = 15000;
    slider.minimumValue = 0;
    slider.value = 15000;
    slider.continuous = YES;
    [slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    [bgView2 addSubview:slider];
    
    _changeSourceLabel.frame = CGRectMake(70+slider.value/15000*(slider.frame.size.width-100), 20, 100, 20);
}

- (void)detailBtnClicked {
    
}

- (void)sliderValueChange:(UISlider *)slider {
    _changeSourceLabel.text = [NSString stringWithFormat:@"%.2f积分",slider.value];
    _resultSourceLabel.text = [NSString stringWithFormat:@"%.2f积分",slider.value];
    _moneyLabel.text        = [NSString stringWithFormat:@"%.2f元",slider.value/100];
    
    _changeSourceLabel.frame = CGRectMake(70+slider.value/15000*(slider.frame.size.width-100), 20, 100, 20);
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
