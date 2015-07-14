//
//  SendViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/13.
//  Copyright (c) 2015年 arong. All rights reserved.
//  转出积分视图控制器

#import "SendViewController.h"

@interface SendViewController ()
{
    //积分滑条
    UISlider * _integralSlider;
    UILabel * _integralLabel;
    //以比率
    UILabel * _compareLabel;
    //转换目标
    UILabel  * _totalLabel;
    
    UIImageView *_totalImageView;
    
    
}
@end

@implementation SendViewController

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
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH/6-10, 0, SCREEN_WIDTH-SCREEN_WIDTH/6, 49) Font:19 Text:@"转出积分" TextColor:[UIColor whiteColor ] TextAligent:NSTextAlignmentLeft];
    
    [naView addSubview:titleLabel];
    
}

-(void)createUI
{
   
    
    for (int i=0 ; i<3; i++) {
        
        UILabel *integral =[GZRControl createLabelWithFrame:CGRectMake(10, 69+i*120, SCREEN_WIDTH-20, 30) Font:17 Text:@"" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
        
        
        [self.view addSubview:integral];
        
        UIImageView * bgImageView =[GZRControl createImageViewWithFrame:CGRectMake(10, 99+i*120, SCREEN_WIDTH-20, 80) ImageName:@"bg"];
        
        
        if (i==0) {
            integral.text =@"将联合积分";
        
            _integralSlider =[[UISlider alloc]initWithFrame:CGRectMake(10,0, SCREEN_WIDTH-40, 50)];
            
            [bgImageView addSubview:_integralSlider];
            
            _integralLabel =[GZRControl createLabelWithFrame:CGRectMake(10, 40, SCREEN_WIDTH-40, 30) Font:17 Text:@"2000积分" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentCenter];

            [bgImageView addSubview:_integralLabel];
            
        }
        
        if (i==1) {
            integral.text =@"以比率";
            
            _compareLabel =[GZRControl createLabelWithFrame:CGRectMake(40, 20, SCREEN_WIDTH-100, 40) Font:17 Text:@"1:1" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentCenter];
            
            [bgImageView addSubview:_compareLabel];
            
            
        }
        
                                    
        if (i==2) {
            integral.text =@"转换给";
            
            _totalImageView =[GZRControl createImageViewWithFrame:CGRectMake(10, 25, 30, 30) ImageName:@"u997"];
            [bgImageView addSubview:_totalImageView];
        
            _totalLabel =[GZRControl createLabelWithFrame:CGRectMake(50, 25, SCREEN_WIDTH-120, 30) Font:20 Text:@"中国移动" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
            
            
            [bgImageView addSubview:_totalLabel];
            
            
        }
        
        
        [self.view addSubview:bgImageView];

        
        
    }
    
    
    
    
    UIButton *sureButton =[GZRControl createButtonWithFrame:CGRectMake(0, SCREEN_HEIGHT-50,SCREEN_WIDTH ,50 ) ImageName:@"" Target:self Action:@selector(buttonClick:) Title:@"确定" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:0 masks:YES];
    
    
    [self.view addSubview:sureButton];
    
    
    
    
}

-(void)buttonClick:(UIButton *)btn
{
    
    
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
