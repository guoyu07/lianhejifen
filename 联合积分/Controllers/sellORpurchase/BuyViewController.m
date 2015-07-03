//
//  BuyViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/2.
//  Copyright (c)2015年 arong. All rights reserved.
//

#import "BuyViewController.h"
#import "HistoryBuyCell.h"
@interface BuyViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    //历史交易记录
    UITableView *hisTableView;
    NSMutableArray *hisArray;
    

    //上部视图
    UIView *_headerView;
    //滑条
    UISlider *_buySlider;
    UILabel *_buyLabel;
    
    UISlider *_priceSlider;
    UILabel  *_priceLabel;
    
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
    hisTableView.separatorStyle =UITableViewCellSelectionStyleNone;
    [self.view addSubview:hisTableView];

    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return hisArray.count;
    
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    _headerView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    _headerView.backgroundColor =[UIColor whiteColor];

    //设置滑动条slider的一些基本属性
    _buySlider = [[UISlider alloc]init];
    _buySlider.frame = CGRectMake(70, 100-69+20, SCREEN_WIDTH-80, 50); //滑动条的位置，大小
    _buySlider.minimumValue = 0; //最小值
    _buySlider.maximumValue = 500; //最大值
    _buySlider.value = 0; //默认值
    
    //sliderValueChanged事件
    [_buySlider addTarget:self action:@selector(buySliderValueChange:) forControlEvents:UIControlEventValueChanged];
    //设置label的属性
    _buyLabel = [[UILabel alloc]initWithFrame:CGRectMake(_buySlider.frame.origin.x-20, _buySlider.frame.origin.y-10, 70, 20)];
    _buyLabel.textAlignment =NSTextAlignmentCenter;
    [_buyLabel setBackgroundColor:[UIColor clearColor]];
    [_buyLabel setText:[NSString stringWithFormat:@"%d积分",(int)_buySlider.value]];
    
    [_headerView addSubview:_buySlider];
    [_headerView addSubview:_buyLabel];

    UILabel * titleLabel1 =[GZRControl createLabelWithFrame:CGRectMake(20, 100-69+30, 50,30 ) Font:20 Text:@"求购" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    
    [_headerView addSubview:titleLabel1];
    
    //设置滑动条slider的一些基本属性
    _priceSlider = [[UISlider alloc]init];
    _priceSlider.frame = CGRectMake(70, 170-69+20, SCREEN_WIDTH-80, 50); //滑动条的位置，大小
    _priceSlider.minimumValue = 0; //最小值
    _priceSlider.maximumValue = 500; //最大值
    _priceSlider.value = 0; //默认值
    
    //sliderValueChanged事件
    [_priceSlider addTarget:self action:@selector(priceSliderValueChange:) forControlEvents:UIControlEventValueChanged];
    //设置label的属性
     _priceLabel= [[UILabel alloc]initWithFrame:CGRectMake(_priceSlider.frame.origin.x-20, _priceSlider.frame.origin.y-10, 70, 20)];
    _priceLabel.textAlignment =NSTextAlignmentCenter;
    [_priceLabel setBackgroundColor:[UIColor clearColor]];
    [_priceLabel setText:[NSString stringWithFormat:@"￥%d",(int)_priceSlider.value]];
    
    [_headerView addSubview:_priceSlider];
    [_headerView addSubview:_priceLabel];
    
    
    UILabel * titleLabel2 =[GZRControl createLabelWithFrame:CGRectMake(20, 170-69+30, 50,30 ) Font:20 Text:@"出价" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    
    [_headerView addSubview:titleLabel2];
    

    
    UIButton *releaseButton =[GZRControl createButtonWithFrame:CGRectMake(10, 250-69, SCREEN_WIDTH-20, 50) ImageName:@"" Target:self Action:@selector(releaseButtonClick:) Title:@"发布" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:0 masks:YES];
    
    [_headerView addSubview:releaseButton];

    
    return _headerView;
    
}

-(void)buySliderValueChange:(UISlider *)slider
{
    //调节数字追随滑动速度
   // integralLabel.frame =CGRectMake(80+slider.value/1000*slider.frame.size.width, 100-69, 60, 30);

    UIImageView *imageView = [_buySlider.subviews objectAtIndex:2];
    CGRect theRect = [_headerView convertRect:imageView.frame fromView:imageView.superview];
    [_buyLabel setFrame:CGRectMake(theRect.origin.x-22, theRect.origin.y-38, _buyLabel.frame.size.width, _buySlider.frame.size.height)];
    
    NSInteger v = _buySlider.value+0.5;
    //label的显示数字。为滑动条移动后的位置的value
    [_buyLabel setText:[NSString stringWithFormat:@"%d积分",(int)v]];
    

}

-(void)priceSliderValueChange:(UISlider *)slider
{
    
    UIImageView *imageView = [_priceSlider.subviews objectAtIndex:2];
    CGRect theRect = [_headerView convertRect:imageView.frame fromView:imageView.superview];
    [_priceLabel setFrame:CGRectMake(theRect.origin.x-22, theRect.origin.y-38, _priceLabel.frame.size.width, _priceSlider.frame.size.height)];
    
    NSInteger v = _priceSlider.value+0.5;
    //label的显示数字。为滑动条移动后的位置的value
    [_priceLabel setText:[NSString stringWithFormat:@"￥%d",(int)v]];

    
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
