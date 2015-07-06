//
//  TradeViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/6/30.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "TradeViewController.h"
#import "GoodsCell.h"
#import "GoodsModel.h"
#import "OrderDetaikViewController.h"
#import "VolumeCell.h"
#import "MoneyCell.h"
#import "PaymentCell.h"
@interface TradeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *titleArray;
    
    UIButton *currentBtn;
    //商品表
    UITableView *goodsTableView;
    NSMutableArray *goodsArray;
    
    //电子卷表
    UITableView *volumeTableView;
    NSMutableArray *volumeArray;
    
    //理财
    UITableView *moneyTableView;
    NSMutableArray *moneyArray;
    
    //支付
    UITableView *paymentTableView;
    NSMutableArray *paymentArray;
    
    
    
}
@end

@implementation TradeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    [self createNa];
    [self createUI];
    [self createData];
}

-(void)createNa
{
    UIView *naView =[[UIView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH,49 )];
    
    naView.backgroundColor =RGBCOLOR(228, 35, 117);
    [self.view addSubview:naView];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(5, 10, 30,30)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"u257"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [naView addSubview:leftButton];
    
    titleArray =[NSMutableArray arrayWithObjects:@"商品",@"电子卷",@"理财",@"支付", nil];
    int i=0;
    for (NSString *title in titleArray) {
        
        UIButton *titleButton =[GZRControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH/5+i*SCREEN_WIDTH/5, 0,SCREEN_WIDTH/5, 49) ImageName:@"" Target:self Action:@selector(titleButtonClick:) Title:title titleColor:[UIColor lightGrayColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:1 masks:YES];
        
        if (i==0) {
            currentBtn =titleButton;
            currentBtn.selected =YES;
        }
        
        [titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        titleButton.tag =100+i;
                                
        [naView addSubview:titleButton];
        i++;
        
    }
    
}

-(void)titleButtonClick:(UIButton *)btn
{
    currentBtn.selected =NO;
    btn.selected =YES;
    currentBtn =btn;
    if (currentBtn.tag ==100) {
        goodsTableView.hidden =NO;
        volumeTableView.hidden =YES;
        moneyTableView.hidden =YES;
        paymentTableView.hidden =YES;
        
    }
    else if(currentBtn.tag ==101)
    {
        volumeTableView.hidden =NO;
        moneyTableView.hidden =YES;
        goodsTableView.hidden =YES;
        paymentTableView.hidden =YES;
        
    }
    else if(currentBtn.tag ==102)
    {
        moneyTableView.hidden =NO;
        goodsTableView.hidden =YES;
        volumeTableView.hidden =YES;
        paymentTableView.hidden =YES;
        
    }
    else
    {
        paymentTableView.hidden =NO;
        goodsTableView.hidden =YES;
        volumeTableView .hidden =YES;
        moneyTableView.hidden =YES;
        
    }
    logdebug(@"标题按钮被点击");
    
    
    
    
}
-(void)leftButtonClick:(UIButton * )btn
{
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

-(void)createUI
{
    
    goodsTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT-69) style:UITableViewStylePlain];
    goodsTableView.delegate =self;
    goodsTableView.dataSource =self;
    goodsTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:goodsTableView];
    
    
    volumeTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT-69) style:UITableViewStylePlain];
    volumeTableView.delegate =self;
    volumeTableView.dataSource =self;
    volumeTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:volumeTableView];
    volumeTableView.hidden =YES;
    
    moneyTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT-69) style:UITableViewStylePlain];
    moneyTableView.delegate =self;
    moneyTableView.dataSource =self;
    moneyTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:moneyTableView];
    moneyTableView.hidden =YES;
    
    paymentTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT-69) style:UITableViewStylePlain];
    paymentTableView.delegate =self;
    paymentTableView.dataSource =self;
    paymentTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:paymentTableView];
    paymentTableView.hidden =YES;

}

-(void)createData
{
    goodsArray =[[NSMutableArray alloc]init];

    for (int i=0; i<5; i++) {
        GoodsModel *item =[[GoodsModel alloc]init];
        item.goodsName =[NSString stringWithFormat:@"商品%d",i];
        item.goodsColor =@"红色";
        item.integral =[NSString stringWithFormat:@"%d",i+1000];
        item.goodsNum =[NSString stringWithFormat:@"%d",100+i];
        [goodsArray addObject:item];
        
        
    }
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return goodsArray.count;
//    return 20;
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==goodsTableView) {
    
    static NSString *cell1 =@"cell1";
    
    GoodsCell *cell =[tableView dequeueReusableCellWithIdentifier:cell1];
    
    if (cell ==nil) {
        
        cell =[[[NSBundle mainBundle]loadNibNamed:@"GoodsCell" owner:self options:nil]lastObject];
        
        
    }
    
    GoodsModel *item =[goodsArray objectAtIndex:indexPath.row];
    
    [cell loadData:item];
    
    return cell;
    }
    else if(tableView ==volumeTableView){
        static NSString *cell2 =@"cell2";
        
        VolumeCell *cell =[tableView dequeueReusableCellWithIdentifier:cell2];
        if (cell ==nil) {
            
            cell =[[[NSBundle mainBundle ]loadNibNamed:@"VolumeCell" owner:self options:nil]lastObject];
            
            
        }
    
        return cell;
        
    }
    else if(tableView ==moneyTableView)
    {
        static NSString *cell3 =@"cell3";
        
        MoneyCell *cell =[tableView dequeueReusableCellWithIdentifier:cell3];
        if (cell ==nil) {
            
            cell =[[[NSBundle mainBundle ]loadNibNamed:@"MoneyCell" owner:self options:nil]lastObject];
            
        }
        
        return cell;
        
    }
    else
    {
        static NSString *cell4 =@"cell4";
        
        PaymentCell *cell =[tableView dequeueReusableCellWithIdentifier:cell4];
        if (cell ==nil) {
            
            cell =[[[NSBundle mainBundle ]loadNibNamed:@"PaymentCell" owner:self options:nil]lastObject];
            
        }
        
        return cell;

        
        
    }
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    OrderDetaikViewController *orderV =[[OrderDetaikViewController alloc]init];
    
    [self.navigationController pushViewController:orderV animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==moneyTableView) {
        return 150.f;
        
    }
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
