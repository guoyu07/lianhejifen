//
//  AddCardViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/2.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "AddCardViewController.h"
#import "CardDetailViewController.h"
@interface AddCardViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *cardCollectionView;
    
    NSMutableArray *dataArray;
}
@end

@implementation AddCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self createData];
    [self createNa];
    [self createUI];
    
}
-(void)createNa
{
    
    UIView *naView =[[UIView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH,49 )];
    
    naView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:naView];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(5, 5, SCREEN_WIDTH/6-10, 40)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"u532"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [naView addSubview:leftButton];
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH/6-10, 0, SCREEN_WIDTH-SCREEN_WIDTH/6, 49) Font:17 Text:@"选择您要添加的积分账号" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    
    [naView addSubview:titleLabel];
    
    
    
}
-(void)leftButtonClick:(UIButton *)btn
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

-(void)createData
{
    
    
    
    dataArray =[NSMutableArray arrayWithObjects:@"u742",@"u744",@"u746",@"u750",@"u754",@"u762", nil];
    
    
    
}
-(void)createUI
{
    
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    cardCollectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH ,SCREEN_HEIGHT-69 ) collectionViewLayout:flowLayout];
    cardCollectionView.backgroundColor =[UIColor whiteColor];
    
    cardCollectionView.dataSource=self;
    cardCollectionView.delegate=self;
    //注册Cell，必须要有
    [cardCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    [self.view addSubview:cardCollectionView];

    
}
#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
    
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    //前面已经对cell进行注册
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    
    UIImageView *bgImageView =[[UIImageView alloc]initWithFrame:cell.contentView.bounds];
    bgImageView.image =[UIImage imageNamed:@"u50"];
    [cell.contentView addSubview:bgImageView];
    NSString *str =[dataArray objectAtIndex:indexPath.row];
    UIImageView *iconImageView =[[UIImageView alloc]init];
    iconImageView.image =[UIImage imageNamed:str];
    iconImageView.frame =CGRectMake(0, 0, 50, 50);
    iconImageView.center =cell.contentView.center;
    [bgImageView addSubview:iconImageView];
    return cell;
}


//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(SCREEN_WIDTH/2-8, SCREEN_WIDTH/2-8);
    
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(2, 2, 2, 2);
}


//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   // [collectionView deselectItemAtIndexPath:indexPath animated:YES];


    CardDetailViewController *cardDetail =[[CardDetailViewController alloc]init];
    
    [self.navigationController pushViewController:cardDetail animated:YES];
    
    
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
