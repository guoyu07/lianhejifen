//
//  ExchangeViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/1.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "ExchangeViewController.h"
#import "ExchangeCell.h"
@interface ExchangeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *cardTableView ;
    
    NSMutableArray *cardArray;
    
}
@end

@implementation ExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    [self createNa];
    [self createData];
    [self createUI];
    [self createBottom];
    
    
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
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH/6-10, 0, SCREEN_WIDTH-SCREEN_WIDTH/6, 49) Font:19 Text:@"转为联合积分" TextColor:[UIColor whiteColor ] TextAligent:NSTextAlignmentLeft];
    
    [naView addSubview:titleLabel];
    
//    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(20, 75, SCREEN_WIDTH-20, 40) Font:17 Text:@"将其他账号积分转化为联合积分" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
//    
//    [self.view addSubview:titleLabel];
    
    
}
-(void)leftButtonClicked:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

-(void)createUI
{
    
    cardTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT-69-80) style:UITableViewStylePlain];
    cardTableView.dataSource =self;
    cardTableView.delegate =self;
    
    
    [self.view addSubview:cardTableView];
    
    
}

-(void)createBottom
{
    UIView *bottomView =[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-80, SCREEN_WIDTH, 80)];
    
    bottomView.userInteractionEnabled =YES;
    bottomView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UIImageView *iconImageView =[GZRControl createImageViewWithFrame:CGRectMake(20,20 , 25, 25) ImageName:@"u1003"];
    
    [bottomView addSubview:iconImageView];
    
    UILabel *sureLabel =[GZRControl createLabelWithFrame:CGRectMake(50,20 , 40, 25) Font:18 Text:@"全选" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentCenter];
    
    [bottomView addSubview:sureLabel];
    
    UILabel *integralLabel =[GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH-240, 20, 100, 25) Font:18 Text:@"共获得:900积分" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentCenter];
    
    
    [bottomView addSubview:integralLabel];
    
    
    UIButton *sureButton =[GZRControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH-120, 0, 120, 80) ImageName:@"" Target:self Action:@selector(buttonClick:) Title:@"确定" titleColor:[UIColor blackColor] backColor:[UIColor brownColor] cornerRadius:0 masks:YES];
    
    [bottomView addSubview:sureButton];
    
    
}

-(void)buttonClick:(UIButton *)btn

{
    
    logdebug(@"确定？");
    
    
}

-(void)createData
{
    cardArray =[[NSMutableArray alloc]init];
    
    for (int i=0; i<4; i++) {
        
        NSString *str =[NSString stringWithFormat:@"商品%d",i];
        
        [cardArray addObject:str];
        
        
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return cardArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName =@"cellName";
    
    ExchangeCell *cell =[tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell ==nil) {
        
        cell =[[[NSBundle mainBundle]loadNibNamed:@"ExchangeCell" owner:self options:nil]lastObject];
        
        
    }
    [cell loadData:indexPath];
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 120.f;
    
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
