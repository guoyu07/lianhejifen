//
//  RootViewController.m
//  联合积分
//
//  Created by 开发部001 on 15/6/23.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "RootViewController.h"
#import "CustomView.h"
#import "FlistCell.h"
#import "SlistCell.h"
#import "TlistCell.h"
#import "CardbagViewController.h"
#import "TradeViewController.h"
#import "SellViewController.h"
#import "ConsumeViewController.h"
#import "FinancialViewController.h"
#import "BuyViewController.h"
#import "EarnViewController.h"

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

{
    UILabel         *_sourceLabel;     // 导航中显示积分的label标签
    UIScrollView    *_bgScrollView;    // 承载所有界面的底层滚动视图
    UIScrollView    *_topScrollView;   // 承载展示列表的横向滚动视图
    UIView          *_listView;        // 承载横向滚动的view
    UITableView     *_tableView;
    CustomView      *_customView;      // 自定义图形显示
    NSMutableArray  *_btnArray;
    NSMutableArray  *_tradeBtnArray;
    NSInteger       _currentIndex;
    UILabel         *_lineLabel;       // 指示当前选中按钮
    
    NSMutableArray  *_dataArray;
    NSMutableArray  *_dataArrayT;
    
    NSInteger       _lastPosition;     // 滚动视图的上一次偏移量
    NSInteger       _fixedH;           // listView的固定高度
    NSInteger       _gapDis;           // 滚动视图的实际偏移量
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    
    [self prepareData];
    [self configUI];
    [self createTopButton];
}

// 准备数据
- (void)prepareData {
    _btnArray = [[NSMutableArray alloc] init];
    _tradeBtnArray = [[NSMutableArray alloc] init];

    _dataArray = [NSMutableArray arrayWithObjects:@"u56.jpg",@"u48.png",@"u58.jpg",@"u60.jpg",@"u64.jpg",@"u68.jpg",@"u72.jpg",@"u56.jpg",@"u58.jpg",@"u60.jpg",@"u64.jpg",@"u68.jpg", nil];
    _dataArrayT = [NSMutableArray arrayWithObjects:@"极速注册中国银行信用卡",@"招行信用卡美国亚马逊海购最高", nil];
    
}

/**
 *  创建导航按钮
 */
- (void)createTopButton {
    _sourceLabel = [GZRControl createLabelWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, 20, 200, 49) Font:17 Text:@"10267" TextColor:[UIColor whiteColor] TextAligent:NSTextAlignmentCenter];
    _sourceLabel.hidden = YES;
    [self.view addSubview:_sourceLabel];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(10, 29, 25, 25)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"u192"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(SCREEN_WIDTH-10-30, 29, 25, 25)];
#warning mark - 需要判断是否登录（对应按钮标识不同）
    [rightButton setBackgroundImage:[UIImage imageNamed:@"u189"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightButton];
}

- (void)leftButtonClicked {
    CardbagViewController *card =[[CardbagViewController alloc]init];
    
    [self.navigationController pushViewController:card animated:YES];
}

- (void)rightButtonClicked {
    
    TradeViewController *trade =[[TradeViewController alloc]init];
    
    [self.navigationController pushViewController:trade animated:YES];
}

- (void)configUI {
    _bgScrollView = [GZRControl makeScrollViewWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20) andSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT*0.3+SCREEN_HEIGHT+50)];
    _bgScrollView.backgroundColor = RGBCOLOR(228, 35, 117);
    _bgScrollView.pagingEnabled = NO;
    _bgScrollView.delegate = self;
    _bgScrollView.tag = 888;
    [self.view addSubview:_bgScrollView];
    
    _customView = [[CustomView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-SCREEN_HEIGHT*0.5*0.6)/2, 49, SCREEN_HEIGHT*0.5*0.6, SCREEN_HEIGHT*0.5*0.6)];
    _customView.backgroundColor = [UIColor clearColor];
    _customView.strArray = @[@"当前积分",@"10267",@"积分价值￥102.67"];
    [_bgScrollView addSubview:_customView];
    
#warning mark - 需要判断是否登录(显示按钮不同)
    NSArray *title = [NSArray arrayWithObjects:@"卖出",@"收购", nil];
    for (int i=0; i<2; i++) {
        UIButton *buttonItem = [GZRControl createButtonWithFrame:CGRectMake((SCREEN_WIDTH-250)/2+i*130, CGRectGetMaxY(_customView.frame)+10, 120, 40)ImageName:nil Target:self Action:@selector(buttonItemClicked:) Title:[title objectAtIndex:i] titleColor:nil backColor:[UIColor whiteColor] cornerRadius:20 masks:YES];
        if (i==0) {
            [buttonItem setTitleColor:RGBCOLOR(147, 169, 154) forState:UIControlStateNormal];
        } else {
            [buttonItem setTitleColor:RGBCOLOR(244, 190, 101) forState:UIControlStateNormal];
        }
        buttonItem.tag = 222 + i;
        
        [_tradeBtnArray addObject:buttonItem];
        [_bgScrollView addSubview:buttonItem];
    }
    
    _listView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_customView.frame)+10+40+20, SCREEN_WIDTH, SCREEN_HEIGHT-69-40)];
    _listView.backgroundColor = RGBCOLOR(228, 35, 117);
    [_bgScrollView addSubview:_listView];
    
    _fixedH = _listView.frame.origin.y;
    _gapDis = (_fixedH-49)/2;
    
    _bgScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(_listView.frame)-_gapDis);
    
    NSArray *listArray = [NSArray arrayWithObjects:@"花积分",@"积分理财",@"赚积分", nil];
    UIButton *listButton;
    for (int i=0; i<listArray.count; i++) {
        listButton = [GZRControl createButtonWithFrame:CGRectMake((SCREEN_WIDTH / 3) * i, 0, SCREEN_WIDTH/3, 40) ImageName:nil Target:self Action:@selector(listButtonClicked:) Title:[listArray objectAtIndex:i] titleColor:RGBCOLOR(243, 164, 203) backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
        [listButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        if (i==0) {
            listButton.selected = YES;
        }
        listButton.tag = 333 + i;
        [_listView addSubview:listButton];
        [_btnArray addObject:listButton];
    }
    
    _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 38, SCREEN_WIDTH/3, 2)];
    _lineLabel.backgroundColor = [UIColor blackColor];
    [_listView addSubview:_lineLabel];
    
    _topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT-69)];
    _topScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, SCREEN_HEIGHT-69-40);
    _topScrollView.backgroundColor = [UIColor clearColor];
    _topScrollView.showsHorizontalScrollIndicator = NO;
    _topScrollView.showsVerticalScrollIndicator = NO;
    _topScrollView.pagingEnabled = YES;
    _topScrollView.bounces = NO;
    _topScrollView.delegate = self;
    _topScrollView.tag = 999;
    [_listView addSubview:_topScrollView];
    
    [self createListViews];
}

- (void)createListViews {
    self.automaticallyAdjustsScrollViewInsets = NO;
    for (int i=0; i<3; i++) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT-69-40) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellAccessoryNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tag = 444 + i;
        _tableView.scrollEnabled = NO;
        [_topScrollView addSubview:_tableView];
    }
}

/**
 *  交易选择事件
 *
 *  @param btn 传入所选择交易的tag值
 */
- (void)buttonItemClicked:(UIButton *)btn {
    if (btn.tag == 222) {
        SellViewController *VC = [[SellViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    } else {
        BuyViewController *buy =[[BuyViewController alloc]init];
        
        [self.navigationController pushViewController:buy animated:YES];
        
        
        
    }

}
/**
 *  选择展示列表
 *
 *  @param btn 传入所选择的button
 */
- (void)listButtonClicked:(UIButton *)btn {
    NSInteger index = btn.tag - 333;
    for (UIButton *currentBtn in _btnArray) {
        if (currentBtn.tag == btn.tag) {
            currentBtn.selected = YES;
        } else {
            currentBtn.selected = NO;
        }
    }
    
    _lineLabel.frame = CGRectMake(SCREEN_WIDTH/3*index, 38, SCREEN_WIDTH/3, 2);
    [_topScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
}

#pragma mark - tableView DataSource && Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (tableView.tag) {
        case 444:
        {
            return _dataArray.count/2;
        }
            break;
        case 445:
        {
            return 10;
        }
            break;
        case 446:
        {
            return _dataArrayT.count+1;
        }
            break;
            
        default:
            break;
    }
    return 0;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (tableView.tag) {
        case 444:
        {
            return (SCREEN_WIDTH-15)/2+5;
        }
            break;
        case 445:
        {
            return 150;
        }
            break;
        case 446:
        {
            return 100;
        }
            break;
            
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (tableView.tag) {
        case 444:
        {
            static NSString *cellId = @"FlistCell";
            FlistCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            if (!cell) {
                cell = [[FlistCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }
            [cell sendValueTag:^(NSInteger tag) {
                if (tag == 89) {
                    logdebug(@"跳转到左侧详情页面!");
                    ConsumeViewController *VC = [[ConsumeViewController alloc] init];
                    VC.titleName = @"Ray-Ban/雷朋金边框蓝色镀膜反光太阳镜";
                    VC.isVouchers = NO;
                    [self.navigationController pushViewController:VC animated:YES];
                } else if (tag == 98) {
                    logdebug(@"跳转到右侧详情页面!");
                    ConsumeViewController *VC = [[ConsumeViewController alloc] init];
                    VC.titleName = @"超市代金券";
                    VC.isVouchers = YES;
                    [self.navigationController pushViewController:VC animated:YES];
                }
            }];
            
            if (indexPath.row < _dataArray.count) {
                cell.leftImageView.image = [UIImage imageNamed:[_dataArray objectAtIndex:indexPath.row*2]];
            }
            if (indexPath.row*2+1 < _dataArray.count) {
                cell.rightImageView.image = [UIImage imageNamed:[_dataArray objectAtIndex:indexPath.row*2+1]];
            }
            
            return cell;
        }
            break;
        case 445:
        {
            static NSString *cellId = @"SlistCell";
            SlistCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"SlistCell" owner:self options:nil] lastObject];
                cell.saveButton.layer.cornerRadius = 15;
                cell.saveButton.layer.masksToBounds = YES;
                cell.saveButton.layer.borderWidth = 1.0;
                cell.saveButton.layer.borderColor = [RGBCOLOR(228, 35, 117) CGColor];
            }
            return cell;
        }
            break;
        case 446:
        {
            static NSString *cellId = @"TlistCell";
            TlistCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"TlistCell" owner:self options:nil] lastObject];
                
            }
            
            if (indexPath.row == 0) {
                cell.sourceLabel.hidden = YES;
                cell.bgImageView.backgroundColor = [UIColor brownColor];
            } else {
                cell.sourceLabel.hidden = NO;
                cell.titleLabel.text = [_dataArrayT objectAtIndex:indexPath.row-1];
            }
            
            return cell;
        }
            break;
            
        default:
            break;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (tableView.tag) {
        case 445:
        {
            FinancialViewController *VC = [[FinancialViewController alloc] init];
            VC.titleName = @"油利可图201501";
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 446:
        {
            if (indexPath.row == 1) {
                EarnViewController *VC = [[EarnViewController alloc] init];
                VC.titleName = @"极速注册";
                [self.navigationController pushViewController:VC animated:YES];
            }
            
        }
            break;
            
        default:
            break;
    }
    logdebug(@"跳转到相应的页面!");
}

#pragma mark - scrollView Delegate
// 即将开始拖拽的时候
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    logdebug(@"gapDis:%d",_gapDis);
    if (scrollView.contentOffset.y < _gapDis) {
        _tableView.scrollEnabled = NO;
    } else {
        _tableView.scrollEnabled = YES;
    }
    
}
// 拖拽过程中实时调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == 888) {
        logdebug(@"xxxxx:%f yyyyyy:%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
        
        NSInteger currentPosition = scrollView.contentOffset.y;
        
        if (currentPosition - _lastPosition > 0) { // 向上滑动触发
            _lastPosition = currentPosition;
            _listView.frame = CGRectMake(0, _fixedH-currentPosition, SCREEN_WIDTH, SCREEN_HEIGHT-69);
        } else if (_lastPosition - currentPosition > 0) { // 向下滑动触发
            logdebug(@"_lastPosition:%d    currentPosition:%d",_lastPosition,currentPosition);
            _lastPosition = currentPosition;
            _listView.frame = CGRectMake(0, _fixedH+(_gapDis-currentPosition)/2-166, SCREEN_WIDTH, SCREEN_HEIGHT-69);
        }
        
        if (scrollView.contentOffset.y >= 120) {
            _sourceLabel.hidden = NO;
            for (UIButton *btn in _tradeBtnArray) {
                btn.hidden = YES;
                _customView.hidden = YES;
            }
        } else {
            _sourceLabel.hidden = YES;
            for (UIButton *btn in _tradeBtnArray) {
                btn.hidden = NO;
                _customView.hidden = NO;
            }
        }
    }
    
    if (scrollView.contentOffset.y == _gapDis) {
        _tableView.scrollEnabled = YES;
    }
}
// 结束拖拽时调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    logdebug(@"gapDis:%d",_gapDis);
    
    if (scrollView.contentOffset.y >= _gapDis-50 && scrollView.tag == 888) {
        [UIView animateWithDuration:0.3 animations:^{
            _bgScrollView.contentOffset = CGPointMake(0, _gapDis);
        }];
        logdebug(@"currentGapDis:%d",_gapDis);
    }
}

// 减速到停止时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (![scrollView isKindOfClass:[UITableView class]] && scrollView.tag == 999) {
        CGPoint pt = scrollView.contentOffset;
        _currentIndex = pt.x/SCREEN_WIDTH;
        
        for (UIButton *btn in _btnArray) {
            if (btn.tag-333 == _currentIndex) {
                btn.selected = YES;
            } else {
                btn.selected = NO;
            }
        }
        _lineLabel.frame = CGRectMake(SCREEN_WIDTH/3*_currentIndex, 38, SCREEN_WIDTH/3, 2);
    }
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
