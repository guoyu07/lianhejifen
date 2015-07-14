//
//  AboutViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/14.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH/6-10, 0, SCREEN_WIDTH-SCREEN_WIDTH/6, 49) Font:19 Text:@"关于" TextColor:[UIColor whiteColor ] TextAligent:NSTextAlignmentLeft];
    
    [naView addSubview:titleLabel];
    
}

-(void)leftButtonClicked:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)createUI
{
    UIImageView * logoImageview =[[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 109, 100, 100)];
    
    logoImageview.image =[UIImage imageNamed:@"u251"];
    
    logoImageview.layer.borderWidth = 2.0;//边框

    [self.view addSubview:logoImageview];
    //联合积分
    UILabel *title =[GZRControl createLabelWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 219, 100, 25) Font:16 Text:@"联合积分" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentCenter];
    [self.view addSubview:title];
    
    //版本
    UILabel *version =[GZRControl createLabelWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 239, 100, 25) Font:16 Text:@"v1.1.0" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentCenter];
    
    [self.view addSubview:version];
    
    NSArray *titleArray =[NSArray arrayWithObjects:@"QQ群125118766",@"隐私协议",@"官方网站",@"检查更新", nil];
    
    for (int i =0; i<4; i++) {
        UIButton *titleBtn =[GZRControl createButtonWithFrame:CGRectMake((SCREEN_WIDTH-160)/2, 279+i*40, 160, 30)ImageName:@"" Target:self Action:@selector(titleButtonClick:) Title:[titleArray objectAtIndex:i] titleColor:[UIColor blackColor] backColor:[UIColor whiteColor] cornerRadius:0 masks:YES];
        titleBtn.tag =100+i;
        titleBtn.titleLabel.font =[UIFont systemFontOfSize:16];
        [self.view addSubview:titleBtn];
        //添加下面横线
        if (i!=3) {
        UIView *lineView =[[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-160)/2, 279+i*40+30, 160, 1.5)];
        lineView.backgroundColor =[UIColor lightGrayColor];
        
        [self.view addSubview:lineView];
        
        
        }
    }
    
}

-(void)titleButtonClick:(UIButton *)btn
{
    logdebug(@"%d 按钮被点击了",btn.tag);
    
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
