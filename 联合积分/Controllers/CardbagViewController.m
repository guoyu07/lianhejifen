//
//  CardbagViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/6/29.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "CardbagViewController.h"
#import "CardModel.h"
#import "CardCell.h"
#import "ExchangeViewController.h"
@interface CardbagViewController ()<UITableViewDataSource,UITableViewDelegate,MyProtocalDelegate>
{
    UITableView *cardTableView; //卡包中包含的积分类别
    NSMutableArray *dataArray;  //数据数组
    
    UIView *moreView;
    BOOL isMore;
}
@end

@implementation CardbagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
   
    [self createNa];
    [self createUI];

    [self createMore];
     moreView.hidden =YES;
    isMore =NO;
    [self createData];
    [self createBottom];
    
}

-(void)createNa
{
    UIView *naView =[[UIView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH,49 )];
    
    naView.backgroundColor =RGBCOLOR(228, 35, 117);
    [self.view addSubview:naView];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(5, 9, 70, 40)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"卡包"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [naView addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(SCREEN_WIDTH-80, 9, 70, 40)];
    
    [rightButton setBackgroundImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [naView addSubview:rightButton];

    
}

- (void)leftButtonClicked {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)rightButtonClicked:(UIButton *)btn {
    if (isMore ==NO) {
    moreView.hidden =NO;
        isMore =YES;
    }
    else {
        moreView.hidden =YES;
        isMore =NO;
    }
    
}

//更多
-(void)createMore
{

    moreView =[[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-110, 65, 100, 120)];
    moreView.backgroundColor =[UIColor whiteColor];
    moreView.layer.shadowColor =(__bridge CGColorRef)([UIColor blackColor]);
    moreView.layer.shadowOffset =CGSizeMake(3, 3);
    moreView.layer.borderWidth = 1.0;//边框
    moreView.layer.borderColor = [[UIColor grayColor] CGColor];

    
    UIButton *firstButton =[GZRControl createButtonWithFrame:CGRectMake(5, 10, 90, 40) ImageName:@"" Target:self Action:@selector(firstButton) Title:@"反馈" titleColor:[UIColor blackColor] backColor:[UIColor whiteColor] cornerRadius:1 masks:NO];
    
    [moreView addSubview:firstButton];
    
    UIButton *secondButton =[GZRControl createButtonWithFrame:CGRectMake(5, 60, 90, 40) ImageName:@"" Target:self Action:@selector(secondButton) Title:@"关于" titleColor:[UIColor blackColor] backColor:[UIColor whiteColor] cornerRadius:1 masks:NO];
    
    [moreView addSubview:secondButton];

    [self.view addSubview:moreView];
    
    
}

-(void)createBottom
{

    UIView *bottomView =[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-80, SCREEN_WIDTH, 80)];
    bottomView.backgroundColor =[UIColor orangeColor];
    
    [self.view addSubview:bottomView];
    
    bottomView.userInteractionEnabled =YES;
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(20, 20,SCREEN_WIDTH-100 , 40) Font:20 Text:@"转为联合积分，即可兑换丰富商品" TextColor:[UIColor whiteColor] TextAligent:NSTextAlignmentCenter];
    
    [bottomView addSubview:titleLabel];
    
    
    UIImageView *iconImageView =[GZRControl createImageViewWithFrame:CGRectMake(SCREEN_WIDTH-80, 20, 40, 40) ImageName:@"u278"];
    
    [bottomView addSubview:iconImageView];
    
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonClick)];
    
    [bottomView addGestureRecognizer:tapGesture];
    
    
}

-(void)buttonClick
{
    ExchangeViewController *exchange =[[ExchangeViewController alloc]init];
    
    [self.navigationController pushViewController:exchange animated:YES];

}

-(void)firstButton
{
    
    logdebug(@"反馈") ;
}

-(void)secondButton
{
    
    logdebug(@"关于");
    
    
}
-(void)createUI
{
    cardTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT-149) style:UITableViewStylePlain];
    
    
    cardTableView.delegate =self;
    cardTableView.dataSource =self;
    cardTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:cardTableView];
    
}

-(void)createData
{
    
    dataArray =[[NSMutableArray alloc]init];
    CardModel *card =[[CardModel alloc]init];
    
    card.cardName =@"联合积分";
    card.cardNum =@"100000";
    
    [dataArray addObject:card];
    
    for (int i =0; i<10; i++) {
        
        CardModel *card =[[CardModel alloc]init];
        
        card.cardName =[NSString stringWithFormat:@"银行卡%d",i];
        
        card.cardNum =[NSString stringWithFormat:@"%d",i+10000];
        
        
        [dataArray addObject:card];
        
    }

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName =@"cellName";
    
    CardCell *cell =[tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell ==nil) {
        cell = [[CardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        
    }
    CardModel *item =[dataArray objectAtIndex:indexPath.row];
    cell.delegate =self;
    [cell loadData:item index:indexPath];
    return cell;
    
    
}

-(void)leftButtonClick
{
    logdebug(@"转增");
    
    
}

-(void)rightButtonClick
{
    logdebug(@"转出积分");
    
    
}

-(void)exchange
{
    ExchangeViewController *exchange =[[ExchangeViewController alloc]init];
    
    [self.navigationController pushViewController:exchange animated:YES];
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

      [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
    
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 120.0f;
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
