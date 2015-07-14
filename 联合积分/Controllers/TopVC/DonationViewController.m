//
//  DonationViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/13.
//  Copyright (c) 2015年 arong. All rights reserved.
//
//转赠积分试图控制器
#import "DonationViewController.h"

@interface DonationViewController ()
{
    UITextField *_numTextfiled;
    
    UILabel *_integralLabel;
    
    UISlider *_integralSlider;
    
    
}
@end

@implementation DonationViewController
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
    
    naView.backgroundColor =RGBCOLOR(228, 35, 117);
    [self.view addSubview:naView];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(10, 10, 30, 30)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"u257"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [naView addSubview:leftButton];
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH/6-10, 0, SCREEN_WIDTH-SCREEN_WIDTH/6, 49) Font:19 Text:@"转赠" TextColor:[UIColor whiteColor ] TextAligent:NSTextAlignmentLeft];
    
    [naView addSubview:titleLabel];
    
}
-(void)createUI
{
    
    _numTextfiled =[[UITextField alloc]initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH-40, 40)];
    _numTextfiled.placeholder =@"目标账号/手机号";
    _numTextfiled.keyboardType =UIKeyboardTypeNumberPad;
    [self.view addSubview:_numTextfiled];
    
    UIView *lineView =[[UIView alloc]initWithFrame:CGRectMake(20, 140, SCREEN_WIDTH-40, 2)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    [self.view addSubview:lineView];
    
    _integralLabel =[[UILabel alloc]initWithFrame:CGRectMake(20, 180, SCREEN_WIDTH/2, 30)];
    
    _integralLabel.textAlignment =NSTextAlignmentLeft;
    
    _integralLabel.text =@"转赠500积分";
    
    [self.view addSubview:_integralLabel];
    
    
    _integralSlider = [[UISlider alloc]init];
    _integralSlider.frame = CGRectMake(20, 240, SCREEN_WIDTH-40, 40); //滑动条的位置，大小
    _integralSlider.minimumValue = 0; //最小值
    _integralSlider.maximumValue = 2000; //最大值
    _integralSlider.value = 500; //默认值
    
    //sliderValueChanged事件
    [_integralSlider addTarget:self action:@selector(integralSliderValueChange:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:_integralSlider];
    
    
    UIButton *sureBtn =[GZRControl createButtonWithFrame:CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WIDTH, 50) ImageName:@"" Target:self Action:@selector(buttonClick:) Title:@"确定" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:0 masks:YES];
    
    [self.view addSubview:sureBtn];
    
    
}

-(void)integralSliderValueChange:(UISlider *)slider
{
    
    _integralLabel.text =[NSString stringWithFormat:@"转赠%d积分",(int)slider.value];
    
    
}

-(void)buttonClick:(UIButton *)btn
{
    
    logdebug(@"确定");
    
    
}

//关闭键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
    

}
-(void)leftButtonClicked:(UIButton *)btn
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
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
