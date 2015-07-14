//
//  BoundViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/14.
//  Copyright (c) 2015年 arong. All rights reserved.
// 绑定银行卡

#import "BoundViewController.h"

@interface BoundViewController ()
{
    UIImageView *_iconImageView;
    
    UILabel  *_nameLabel;
    
    UILabel  *_numLabel;
    
    
    
}
@end

@implementation BoundViewController

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
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH/6-10, 0, SCREEN_WIDTH-SCREEN_WIDTH/6, 49) Font:17 Text:@"绑定银行卡" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    
    [naView addSubview:titleLabel];
    
}

-(void)createUI
{
    
    UIImageView * bgImageView =[GZRControl createImageViewWithFrame:CGRectMake(10, 99, SCREEN_WIDTH-20, 100) ImageName:@"bg"];
    
    [self.view addSubview:bgImageView];
    
    
    _iconImageView =[[UIImageView alloc]initWithFrame:CGRectMake(10, 35, 30, 30)];
    
    _iconImageView.image =[UIImage imageNamed:@"u820"];
    
    [bgImageView addSubview:_iconImageView];
    
    _nameLabel =[GZRControl createLabelWithFrame:CGRectMake(50, 30, 120,40 ) Font:19 Text:@"招商银行 1127" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    
    [bgImageView addSubview:_nameLabel];
    
    _numLabel =[GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH-120, 30, 100, 40) Font:17 Text:@"1200积分" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
    
    [bgImageView addSubview:_numLabel];
    

}

-(void)leftButtonClick:(UIButton *)btn
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
