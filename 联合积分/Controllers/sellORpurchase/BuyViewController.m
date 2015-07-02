//
//  BuyViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/2.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "BuyViewController.h"
#import "HistoryBuyCell.h"
@interface BuyViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    //历史交易记录
    UITableView *hisTableView;
    NSMutableArray *hisArray;
    
    UILabel * integralLabel;
    UILabel * moneyLabel;
    
}
@end

@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self createData];
    [self createNav];
    
    [self createUI];
    
}
//创建导航
- (void)createNav {
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 49)];
    [navView setBackgroundColor:RGBCOLOR(228, 35, 117)];
    [self.view addSubview:navView];
    UIButton *backBtn = [GZRControl createButtonWithFrame:CGRectMake(10, 0, 49, 49) ImageName:@"u257" Target:self Action:@selector(backBtnClicked) Title:nil titleColor:nil backColor:nil cornerRadius:0 masks:NO];
    [navView addSubview:backBtn];
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(70, 0, 120, 49) Font:25 Text:@"买入积分" TextColor:[UIColor whiteColor] TextAligent:NSTextAlignmentLeft];
    [navView addSubview:titleLabel];
    
    
}

-(void)createData
{
    hisArray =[[NSMutableArray alloc]init];
    for (int i=0; i<5; i++) {
        NSString *str =[NSString stringWithFormat:@"%d",i];
        
        [hisArray addObject:str];
        
        
    }

}

-(void)createUI
{
    
    hisTableView =[[UITableView  alloc]initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT-69) style:UITableViewStylePlain];
    
    hisTableView.delegate =self;
    hisTableView.dataSource =self;
    hisTableView.showsVerticalScrollIndicator =NO;
    [self.view addSubview:hisTableView];

    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return hisArray.count;
    
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    
    UILabel * buyLabel =[GZRControl createLabelWithFrame:CGRectMake(20, 100-69, 50,30 ) Font:20 Text:@"求购" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    
    headerView.backgroundColor =[UIColor whiteColor];
    [headerView addSubview:buyLabel];
    UISlider *buySlider = [[UISlider alloc] initWithFrame:CGRectMake(80,100-69, SCREEN_WIDTH-100  ,30)];
    buySlider.tintColor = RGBCOLOR(228, 35, 117);
    buySlider.thumbTintColor = RGBCOLOR(228, 35, 117);
    buySlider.maximumValue = 1000;
    buySlider.minimumValue = 0;
    buySlider.value = 0;
    buySlider.continuous = YES;
    [buySlider addTarget:self action:@selector(buySliderValueChange:) forControlEvents:UIControlEventValueChanged];
    [headerView addSubview:buySlider];
    integralLabel =[GZRControl createLabelWithFrame:CGRectMake(80, 100-69+30, 60, 30) Font:17 Text:@"1000积分" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [headerView addSubview:integralLabel];
    
    UILabel * priceLabel =[GZRControl createLabelWithFrame:CGRectMake(20, 170-69, 50,30 ) Font:20 Text:@"出价" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    
    [headerView addSubview:priceLabel];
    
    UISlider *prictSlider = [[UISlider alloc] initWithFrame:CGRectMake(80,170-69, SCREEN_WIDTH-100  ,30)];
    prictSlider.tintColor = RGBCOLOR(228, 35, 117);
    prictSlider.thumbTintColor = RGBCOLOR(228, 35, 117);
    prictSlider.maximumValue = 100;
    prictSlider.minimumValue = 0;
    prictSlider.value = 0;
    prictSlider.continuous = YES;
    [prictSlider addTarget:self action:@selector(priceSliderValueChange:) forControlEvents:UIControlEventValueChanged];
    [headerView addSubview:prictSlider];
    moneyLabel =[GZRControl createLabelWithFrame:CGRectMake(80, 170-69+30, 60, 30) Font:17 Text:@"￥100" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [headerView addSubview:moneyLabel];

    
    UIButton *releaseButton =[GZRControl createButtonWithFrame:CGRectMake(10, 250-69, SCREEN_WIDTH-20, 50) ImageName:@"" Target:self Action:@selector(releaseButtonClick:) Title:@"发布" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:0 masks:YES];
    
    [headerView addSubview:releaseButton];

    
    return headerView;
    
}
-(void)buySliderValueChange:(UISlider *)slider
{
    integralLabel.frame =CGRectMake(80+slider.value/1000*slider.frame.size.width, 100-69+30, 60, 30);
    
}

-(void)priceSliderValueChange:(UISlider *)slider
{
    moneyLabel.frame =CGRectMake(80+slider.value/100*slider.frame.size.width, 170-69+30, 60, 30);

    
    
    
}

-(void)releaseButtonClick:(UIButton *)btn
{
    logdebug(@"发布");
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName =@"cellName";
    
    HistoryBuyCell *cell =[tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell ==nil) {
        cell =[[[NSBundle mainBundle]loadNibNamed:@"HistoryBuyCell" owner:self options:nil]lastObject];
        
    }
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 250;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100.f;
    
}
- (void)backBtnClicked {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
