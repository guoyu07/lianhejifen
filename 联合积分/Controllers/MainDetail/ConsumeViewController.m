//
//  ConsumeViewController.m
//  联合积分
//
//  Created by arong on 15/7/2.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "ConsumeViewController.h"
#import "ChooseView.h"

@interface ConsumeViewController ()<UIScrollViewDelegate,ChooseViewDelegate>
{
    UIScrollView  *_bgScrollView;
    UIPageControl *_pageControl;    // 页码指示器
    NSInteger     *_currentIndex;   // 标记当前页
    
    NSMutableArray *_btnArray;      // 存储操作按钮
    
    ChooseView     *_chooseView;    // 承载选择项的view视图
}
@end

@implementation ConsumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configRootView];
    [self prepareData];
    [self createNav];
    if (self.isVouchers) {
        [self createVouchersView];
    } else {
        [self createGoodsView];
    }
}

- (void)createNav {
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 49)];
    [navView setBackgroundColor:RGBCOLOR(228, 35, 117)];
    [self.view addSubview:navView];
    
    UIButton *backBtn = [GZRControl createButtonWithFrame:CGRectMake(5, 10, 30, 30) ImageName:@"u257" Target:self Action:@selector(backBtnClicked) Title:nil titleColor:nil backColor:nil cornerRadius:0 masks:NO];
    [navView addSubview:backBtn];
    
    UILabel *titleLabel = [GZRControl createLabelWithFrame:CGRectMake(35, 15, SCREEN_WIDTH-35, 20) Font:17 Text:self.titleName TextColor:[UIColor whiteColor] TextAligent:NSTextAlignmentLeft];
    titleLabel.numberOfLines = 1;
    [navView addSubview:titleLabel];
}

- (void)backBtnClicked {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/**
 *  准备数据
 */
- (void)prepareData {
    _currentIndex = 0;
    _btnArray = [[NSMutableArray alloc] init];
}

- (void)configRootView {
    UIView *bgView = [GZRControl viewWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT-69) bgColor:RGBCOLOR(235, 235, 235) cornerRadius:0 masks:NO];
    [self.view addSubview:bgView];
    
    _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT-69-49)];
    _bgScrollView.showsHorizontalScrollIndicator = NO;
    _bgScrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_bgScrollView];
    
    UIButton *confirmBtn = [GZRControl createButtonWithFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49) ImageName:nil Target:self Action:@selector(confirmBtnClicked) Title:@"确认兑换" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:0 masks:NO];
    [self.view addSubview:confirmBtn];
    
    
    NSArray *colorArr = [NSArray arrayWithObjects:@"水蓝色",@"黄色",@"粉色", nil];
    NSArray *sizeArr = [NSArray arrayWithObjects:@"1.2m",@"1.35m",@"1.5m",@"1.8m", nil];
    _chooseView = [[ChooseView alloc] init];
    _chooseView.frame = CGRectMake(0, 69, 0, 0);
    _chooseView.backgroundColor = [UIColor whiteColor];
    _chooseView.layer.borderColor = [[UIColor grayColor] CGColor];
    _chooseView.layer.borderWidth = 1.0;
    _chooseView.delegate = self;
    _chooseView.nameArray = [NSMutableArray arrayWithObjects:@"颜色",@"尺寸",@"数量", nil];
    _chooseView.contentArray = [NSMutableArray arrayWithObjects:colorArr,sizeArr, nil];
    [_chooseView createUI];
    [self.view addSubview:_chooseView];
    
}

/**
 *  创建商品展示视图
 */
- (void)createGoodsView {
    UIView *bgView1 = [GZRControl viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_HEIGHT-69-20-49)*4/9) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [_bgScrollView addSubview:bgView1];
    
    UIView *bgView2 = [GZRControl viewWithFrame:CGRectMake(0, CGRectGetMaxY(bgView1.frame)+10, SCREEN_WIDTH, (SCREEN_HEIGHT-69-20-49)*2/9) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [_bgScrollView addSubview:bgView2];
    
    UIView *bgViewAdd = [GZRControl viewWithFrame:CGRectMake(0, CGRectGetMaxY(bgView2.frame)+10, SCREEN_WIDTH, 50) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [_bgScrollView addSubview:bgViewAdd];
    
    UIView *bgView3 = [GZRControl viewWithFrame:CGRectMake(0, CGRectGetMaxY(bgViewAdd.frame)+10, SCREEN_WIDTH, 200) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [_bgScrollView addSubview:bgView3];
    
    _bgScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(bgView3.frame));
    
    /**********创建内容视图1***********/
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_HEIGHT-69-20-49)*4/9)];
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    [bgView1 addSubview:scrollView];
    
    NSArray *imageArr = [NSArray arrayWithObjects:@"u56.jpg",@"u1057.png",@"u1067.jpg",@"u1077.png", nil];
    for (int i=0; i<imageArr.count; i++) {
        UIImageView *headImageView = [GZRControl createImageViewWithFrame:CGRectMake(20+SCREEN_WIDTH*i, 10, SCREEN_WIDTH-40, scrollView.frame.size.height-10) ImageName:[imageArr objectAtIndex:i]];
        [scrollView addSubview:headImageView];
    }
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*imageArr.count, (SCREEN_HEIGHT-69-20-49)*4/9);
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, scrollView.frame.size.height-20, 100, 20)];
    _pageControl.backgroundColor = [UIColor clearColor];
    _pageControl.numberOfPages = imageArr.count;
    _pageControl.currentPage = 0;
    _pageControl.userInteractionEnabled = NO;
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor brownColor];
    [bgView1 addSubview:_pageControl];
    
    /***********创建内容视图2***************/
    UILabel *nameLabel = [GZRControl createLabelWithFrame:CGRectMake(5, 10, SCREEN_WIDTH-10, (bgView2.frame.size.height-25)*2/3) Font:20 Text:self.titleName TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    nameLabel.numberOfLines = 0;
    [bgView2 addSubview:nameLabel];
    
    UILabel *sourceLabel = [GZRControl createLabelWithFrame:CGRectMake(5, CGRectGetMaxY(nameLabel.frame)+5, 100, (bgView2.frame.size.height-25)*1/3) Font:17 Text:@"2370积分" TextColor:[UIColor brownColor] TextAligent:NSTextAlignmentLeft];
    [bgView2 addSubview:sourceLabel];
    
    UILabel *priceLabel = [GZRControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(sourceLabel.frame)+10, CGRectGetMaxY(nameLabel.frame)+5, 100, (bgView2.frame.size.height-25)*1/3) Font:17 Text:@"￥237.00" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
    [bgView2 addSubview:priceLabel];
    
    UILabel *salesLabel = [GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH-100, CGRectGetMaxY(nameLabel.frame)+5, 100, (bgView2.frame.size.height-25)*1/3) Font:17 Text:@"销量  1031" TextColor:[UIColor darkGrayColor] TextAligent:NSTextAlignmentLeft];
    [bgView2 addSubview:salesLabel];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(priceLabel.frame)-5, CGRectGetMinY(priceLabel.frame)+priceLabel.frame.size.height/2, priceLabel.frame.size.width+10, 1)];
    lineLabel.backgroundColor = [UIColor blackColor];
    lineLabel.transform = CGAffineTransformRotate(lineLabel.transform, 3.0);
    [bgView2 addSubview:lineLabel];
    
    UILabel *chooseLabel = [GZRControl createLabelWithFrame:CGRectMake(20, 10, 150, 30) Font:15 Text:@"选择颜色、尺寸" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [bgViewAdd addSubview:chooseLabel];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureClicked)];
    [bgViewAdd addGestureRecognizer:tap];
    UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-40, 10, 30, 30)];
    [arrowImage setImage:[UIImage imageNamed:@"u532"]];
    arrowImage.transform = CGAffineTransformRotate(arrowImage.transform, 3.1);
    [bgViewAdd addSubview:arrowImage];
    
    /************创建商品说明视图***************/
    NSArray *nameArray = [NSArray arrayWithObjects:@"商品毛重：200.00g",@"偏光性：非偏光镜架",@"商品产地：意大利",@"材质：金属",@"人群：男式",@"功能：太阳镜镜片",@"风格：休闲",@"颜色：金色", nil];
    NSMutableArray *labelArr = [[NSMutableArray alloc] init];
    for (int i=0; i<nameArray.count; i++) {
        UILabel *explainLabel = [GZRControl createLabelWithFrame:CGRectMake(20+i%2*((SCREEN_WIDTH-45)/2+5), 10+i/2*(20+5), (SCREEN_WIDTH-45)/2, 20) Font:15 Text:[nameArray objectAtIndex:i] TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
        [bgView3 addSubview:explainLabel];
        [labelArr addObject:explainLabel];
    }
    UILabel *lastLabel = [labelArr lastObject];
    //    NSInteger serveH = bgView3.frame.size.height - CGRectGetMaxY(lastLabel.frame)+5;
    UILabel *serveLabel = [GZRControl createLabelWithFrame:CGRectMake(20, CGRectGetMaxY(lastLabel.frame)+5, SCREEN_WIDTH-40, 80) Font:15 Text:@"服务：由雷朋官方旗舰店负责发货，并提供售后服务。16:00前完成下单，预计晚饭后到达" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
    serveLabel.numberOfLines = 0;
    [bgView3 addSubview:serveLabel];
}
/**
 *  创建代金券展示视图
 */
- (void)createVouchersView {
    UIView *bgView1 = [GZRControl viewWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, (SCREEN_HEIGHT-69-49-30)/5) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:bgView1];
    
    UIView *bgView2 = [GZRControl viewWithFrame:CGRectMake(0, CGRectGetMaxY(bgView1.frame)+10, SCREEN_WIDTH, (SCREEN_HEIGHT-69-49-30)/5) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:bgView2];
    
    UIView *bgView3 = [GZRControl viewWithFrame:CGRectMake(0, CGRectGetMaxY(bgView2.frame)+10, SCREEN_WIDTH, (SCREEN_HEIGHT-69-49-30)*2/5) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:bgView3];
    
    UIView *bgView4 = [GZRControl viewWithFrame:CGRectMake(0, CGRectGetMaxY(bgView3.frame)+10, SCREEN_WIDTH, (SCREEN_HEIGHT-69-49-30)/5) bgColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
    [self.view addSubview:bgView4];
    
    
    /*********创建内容视图1**********/
    UILabel *nameLabel = [GZRControl createLabelWithFrame:CGRectMake(20, (bgView1.frame.size.height-40)/3, 120, 20) Font:17 Text:self.titleName TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [bgView1 addSubview:nameLabel];
    
    UILabel *sourceLabel = [GZRControl createLabelWithFrame:CGRectMake(20, (bgView1.frame.size.height-40)/3*2+20, 100, 20) Font:15 Text:@"4990积分" TextColor:[UIColor brownColor] TextAligent:NSTextAlignmentLeft];
    [bgView1 addSubview:sourceLabel];
    
    UILabel *priceLabel = [GZRControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(sourceLabel.frame)+10, (bgView1.frame.size.height-40)/3*2+20, 80, 20) Font:15 Text:@"￥50.00" TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
    [bgView1 addSubview:priceLabel];
    
    UILabel *salesLabel = [GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH-20-100, (bgView1.frame.size.height-40)/3*2+20, 100, 20) Font:15 Text:@"销量 1031" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentRight];
    [bgView1 addSubview:salesLabel];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(sourceLabel.frame)+5, (bgView1.frame.size.height-40)/3*2+24, 80, 1)];
    [lineLabel setBackgroundColor:[UIColor blackColor]];
    lineLabel.transform = CGAffineTransformRotate(lineLabel.transform, 2.9);
    [bgView1 addSubview:lineLabel];
    
    /**************创建内容视图2****************/
    UILabel *titleLabel = [GZRControl createLabelWithFrame:CGRectMake(20, (bgView2.frame.size.height-60)/3, 80, 20) Font:15 Text:@"选择金额" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [bgView2 addSubview:titleLabel];
    
    NSArray *moneyArr = [NSArray arrayWithObjects:@"10",@"20",@"50",@"100",@"200", nil];
    NSInteger spw = (SCREEN_WIDTH-40-100)/4;
    for (int i=0; i<5; i++) {
        UIButton *chooseBtn = [GZRControl createButtonWithFrame:CGRectMake(20+(spw+20)*i, (bgView2.frame.size.height-60)/3*2+20, 20, 20) ImageName:@"u1147" Target:self Action:@selector(chooseBtnClicked:) Title:nil titleColor:[UIColor clearColor] backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
        [chooseBtn setBackgroundImage:[UIImage imageNamed:@"u1153"] forState:UIControlStateSelected];
        if (i==0) {
            chooseBtn.selected = YES;
        }
        chooseBtn.tag = 111+i;
        [bgView2 addSubview:chooseBtn];
        [_btnArray addObject:chooseBtn];
        
        UILabel *moneyLabel = [GZRControl createLabelWithFrame:CGRectMake(20+(spw+20)*i, (bgView2.frame.size.height-60)/3*2+40, 20, 20) Font:10 Text:[moneyArr objectAtIndex:i] TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentCenter];
        [bgView2 addSubview:moneyLabel];
        
        if (i<4) {
            UILabel *spaceLabel = [[UILabel alloc] initWithFrame:CGRectMake(40+(spw+20)*i, (bgView2.frame.size.height-60)/3*2+29, spw, 1)];
            [spaceLabel setBackgroundColor:[UIColor lightGrayColor]];
            [bgView2 addSubview:spaceLabel];
        }
    }
}

- (void)tapGestureClicked {
    [UIView animateWithDuration:0.3 animations:^{
        _chooseView.frame = CGRectMake(0, SCREEN_HEIGHT-_chooseView.frame.size.height, _chooseView.frame.size.width, _chooseView.frame.size.height);
    }];
}

/**
 *  选择金额
 */
- (void)chooseBtnClicked:(UIButton *)btn {
    
    for (UIButton *currentBtn in _btnArray) {
        if (currentBtn.tag == btn.tag) {
            currentBtn.selected = YES;
        } else {
            currentBtn.selected = NO;
        }
    }
    
}

/**
 *  确认兑换操作响应
 */
- (void)confirmBtnClicked {
    
}

#pragma mark - scrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint pt = scrollView.contentOffset;
    _pageControl.currentPage = pt.x/SCREEN_WIDTH;
    //    _currentIndex = pt.x/SCREEN_WIDTH;
}

#pragma mark - ChooseViewDelegate
- (void)makeViewRectY:(NSInteger)rectY {
    _chooseView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, rectY);
    logdebug(@"chooseViewHeight:%ld",rectY);
}

- (void)confirmAndgetInformation:(NSDictionary *)infoDic {
    [UIView animateWithDuration:0.5 animations:^{
        _chooseView.frame = CGRectMake(0, SCREEN_HEIGHT, _chooseView.frame.size.width, _chooseView.frame.size.height);
    }];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:0.5 animations:^{
        _chooseView.frame = CGRectMake(0, SCREEN_HEIGHT, _chooseView.frame.size.width, _chooseView.frame.size.height);
    }];
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
