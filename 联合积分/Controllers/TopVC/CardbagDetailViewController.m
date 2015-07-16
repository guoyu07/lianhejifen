//
//  CardbagDetailViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/15.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "CardbagDetailViewController.h"

@interface CardbagDetailViewController ()

@end

@implementation CardbagDetailViewController

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
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH/6-10, 0, SCREEN_WIDTH-SCREEN_WIDTH/6, 49) Font:19 Text:self.titleName TextColor:[UIColor whiteColor ] TextAligent:NSTextAlignmentLeft];
    
    [naView addSubview:titleLabel];
    
}

-(void)createUI
{
    NSArray *labArray =[NSArray arrayWithObjects:@"剩余积分",@"",@"会员等级",@"转为联合积分", @"删除账号",nil];
    NSArray *valueArray =[NSArray arrayWithObjects:@"400",@"300积分即将过期",@"白金会员", nil];
    
    for (int i=0; i<5; i++) {
        
        if (i!=1) {
            
        UILabel *title =[GZRControl createLabelWithFrame:CGRectMake(20,69+i*50 , (SCREEN_WIDTH-40)/2, 40) Font:20 Text:[labArray objectAtIndex:i] TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
        
        [self.view addSubview:title];
        
        }
        if (i<3) {
            
            UILabel *value =[GZRControl createLabelWithFrame:CGRectMake(20+(SCREEN_WIDTH-40)/2,69+i*50 , (SCREEN_WIDTH-20)/2, 40) Font:17 Text:[valueArray objectAtIndex:i] TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentRight];
            
            [self.view addSubview:value];
            
        }
        
    }
    
    
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
