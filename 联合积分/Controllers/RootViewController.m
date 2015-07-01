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

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UILabel      *_sourceLabel;     // 导航中显示积分的label标签
    UIScrollView *_bgScrollView;    // 承载所有界面的底层滚动视图
    UIScrollView *_topScrollView;   // 承载展示列表的横向滚动视图
    UIView       *_listView;        // 承载横向滚动的view
    NSMutableArray  *_btnArray;
    NSMutableArray  *_tradeBtnArray;
    NSInteger    _currentIndex;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    _btnArray = [[NSMutableArray alloc] init];
    _tradeBtnArray = [[NSMutableArray alloc] init];
    
    [self configUI];
    [self createTopButton];
}
/**
 *  创建导航按钮
 */
- (void)createTopButton {
    _sourceLabel = [GZRControl createLabelWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, 20, 200, 49) Font:17 Text:@"10267" TextColor:[UIColor whiteColor] TextAligent:NSTextAlignmentCenter];
    _sourceLabel.hidden = YES;
    [self.view addSubview:_sourceLabel];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(10, 29, 30, 30)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"u192"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(SCREEN_WIDTH-10-30, 29, 30, 30)];
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
    
    CustomView *customView = [[CustomView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-SCREEN_HEIGHT*0.5*0.6)/2, 49, SCREEN_HEIGHT*0.5*0.6, SCREEN_HEIGHT*0.5*0.6)];
    customView.strArray = @[@"当前积分",@"10267",@"积分价值￥102.67"];
    customView.backgroundColor = [UIColor clearColor];
    [_bgScrollView addSubview:customView];
    
#warning mark - 需要判断是否登录(显示按钮不同)
    NSArray *title = [NSArray arrayWithObjects:@"卖出",@"收购", nil];
    for (int i=0; i<2; i++) {
        UIButton *buttonItem = [GZRControl createButtonWithFrame:CGRectMake((SCREEN_WIDTH-250)/2+i*130, CGRectGetMaxY(customView.frame)+10, 120, 40)ImageName:nil Target:self Action:@selector(buttonItemClicked:) Title:[title objectAtIndex:i] titleColor:nil backColor:[UIColor whiteColor] cornerRadius:15 masks:YES];
        if (i==0) {
            [buttonItem setTitleColor:RGBCOLOR(147, 169, 154) forState:UIControlStateNormal];
        } else {
            [buttonItem setTitleColor:RGBCOLOR(244, 190, 101) forState:UIControlStateNormal];
        }
        buttonItem.tag = 222 + i;
        
        [_tradeBtnArray addObject:buttonItem];
        [_bgScrollView addSubview:buttonItem];
    }
    
    _listView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(customView.frame)+10+40+20, SCREEN_WIDTH, SCREEN_HEIGHT-69)];
    _listView.backgroundColor = [UIColor purpleColor];
    [_bgScrollView addSubview:_listView];
    
    NSArray *listArray = [NSArray arrayWithObjects:@"花积分",@"积分理财",@"赚积分", nil];
    UIButton *listButton;
    for (int i=0; i<listArray.count; i++) {
        listButton = [GZRControl createButtonWithFrame:CGRectMake((SCREEN_WIDTH / 3) * i, 0, SCREEN_WIDTH/3, 40) ImageName:nil Target:self Action:@selector(listButtonClicked:) Title:[listArray objectAtIndex:i] titleColor:[UIColor lightGrayColor] backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
        [listButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        if (i==0) {
            listButton.selected = YES;
        }
        listButton.tag = 333 + i;
        [_listView addSubview:listButton];
        [_btnArray addObject:listButton];
    }
    
    _topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT-69)];
    _topScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, SCREEN_HEIGHT);
    _topScrollView.backgroundColor = [UIColor brownColor];
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
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT-69-40) style:UITableViewStylePlain];
        tableView.separatorStyle = UITableViewCellAccessoryNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tag = 444 + i;
        [_topScrollView addSubview:tableView];
    }
}

/**
 *  交易选择事件
 *
 *  @param btn 传入所选择交易的tag值
 */
- (void)buttonItemClicked:(UIButton *)btn {
    logdebug(@"卖出or收购!");
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
    
    [_topScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
}

#pragma mark - tableView DataSource && Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (tableView.tag) {
        case 444:
        {
            return 152;
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
                cell = [[[NSBundle mainBundle] loadNibNamed:@"FlistCell" owner:self options:nil] lastObject];
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
    logdebug(@"跳转到相应的页面!");
}

#pragma mark - scrollView Delegate
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
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == 888) {
        logdebug(@"%f",scrollView.contentOffset.y);
        
        if (scrollView.contentOffset.y >= 270) {
            _sourceLabel.hidden = NO;
            for (UIButton *btn in _tradeBtnArray) {
                btn.hidden = YES;
            }
        } else {
            _sourceLabel.hidden = YES;
            for (UIButton *btn in _tradeBtnArray) {
                btn.hidden = NO;
            }
        }
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
