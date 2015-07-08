//
//  OrderDetaikViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/6/30.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "OrderDetaikViewController.h"

@interface OrderDetaikViewController ()
{
    NSMutableArray *titleArray;
    
    NSMutableArray *orderArray;
    
    
    
}
@end

@implementation OrderDetaikViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self createNa];
    [self createData];
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
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [naView addSubview:leftButton];
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH/6, 0, SCREEN_WIDTH/3, 49) Font:20 Text:@"订单详情" TextColor:[UIColor whiteColor] TextAligent:NSTextAlignmentCenter];
    
    [naView addSubview:titleLabel];
    
    
    
}
-(void)leftButtonClick:(UIButton *)btn
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}



-(void)createData
{
    titleArray =[NSMutableArray arrayWithObjects:@"收货人:",@"联系方式:",@"收货地址:",@"订单号:",@"付款时间:",@"商品详情:",@"备注:", nil];
    
    
    orderArray =[NSMutableArray arrayWithObjects:@"小明",@"12345678665",@"北京市朝阳区",@"20151314",@"2015-01-25",@" ",@" ", nil];
    
    
    
}

-(void)createUI
{
    int i=0;
    for (NSString *str  in titleArray) {
        UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(10, 89+i*40,100 ,30 ) Font:17 Text:str TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
        
        [self.view addSubview:titleLabel];
        
        i++;
        
    }
    int j=0;
    for (NSString *str  in orderArray) {
        UILabel *orderLabel =[GZRControl createLabelWithFrame:CGRectMake(120, 89+j*40,SCREEN_WIDTH-140 ,30 ) Font:17 Text:str TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
        
        [self.view addSubview:orderLabel];
        
        j++;
        
    }

    
    UIButton *relationButton = [GZRControl createButtonWithFrame:CGRectMake(10, 89+i*40,SCREEN_WIDTH-20, 100) ImageName:@"" Target:self Action:@selector(relationButtonClick:) Title:@"联系商家" titleColor: [UIColor blackColor]backColor:[UIColor whiteColor] cornerRadius:0 masks:YES];
    relationButton.titleLabel.font =[UIFont systemFontOfSize:20];
    
    relationButton.layer.borderWidth = 1.0;//边框
    relationButton.layer.borderColor = [[UIColor grayColor] CGColor];

    [self.view addSubview:relationButton];
    
        UIButton *refundButton = [GZRControl createButtonWithFrame:CGRectMake(10, 89+i*40+120,SCREEN_WIDTH-20, 100) ImageName:@"" Target:self Action:@selector(refundButtonClick:) Title:@"申请退款" titleColor: [UIColor redColor]backColor:[UIColor whiteColor] cornerRadius:0 masks:YES];
    
    refundButton.titleLabel.font =[UIFont systemFontOfSize:20];
    refundButton.layer.borderWidth = 1.0;//边框
    refundButton.layer.borderColor = [[UIColor grayColor] CGColor];

    [self.view addSubview:refundButton];
    
}


-(void)relationButtonClick:(UIButton *)btn
{
    logdebug(@"联系商家");
    
}
-(void)refundButtonClick:(UIButton *)btn
{
    logdebug(@"申请退款");
    
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
