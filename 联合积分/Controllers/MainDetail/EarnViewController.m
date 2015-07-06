//
//  EarnViewController.m
//  联合积分
//
//  Created by arong on 15/7/6.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "EarnViewController.h"

@interface EarnViewController ()
{
    NSArray     *_nameArray;
    UITextField *_textField;
    NSMutableArray *_textFieldArray;
}
@end

@implementation EarnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self prepareData];
    [self createNav];
    [self createUI];
}

- (void)createNav {
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 49)];
    [navView setBackgroundColor:RGBCOLOR(228, 35, 117)];
    [self.view addSubview:navView];
    
    UIButton *backBtn = [GZRControl createButtonWithFrame:CGRectMake(5, 10, 30, 30) ImageName:@"u257" Target:self Action:@selector(backBtnClicked) Title:nil titleColor:nil backColor:nil cornerRadius:0 masks:NO];
    [navView addSubview:backBtn];
    
    UILabel *titleLabel = [GZRControl createLabelWithFrame:CGRectMake(35, 15, SCREEN_WIDTH-35, 20) Font:17 Text:self.titleName TextColor:[UIColor whiteColor] TextAligent:NSTextAlignmentLeft];
    [navView addSubview:titleLabel];
}

- (void)backBtnClicked {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)prepareData {
    _nameArray = [NSArray arrayWithObjects:@"姓名",@"手机号",@"身份证",@"单位名称",@"地址", nil];
    _textFieldArray = [[NSMutableArray alloc] init];
}

- (void)createUI {
    for (int i=0; i<5; i++) {
        UILabel *nameLabel = [GZRControl createLabelWithFrame:CGRectMake(20, 69+30+(20+30)*i, 80, 20) Font:17 Text:[_nameArray objectAtIndex:i] TextColor:[UIColor lightGrayColor] TextAligent:NSTextAlignmentLeft];
        [self.view addSubview:nameLabel];
        
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 69+50+15+50*i, SCREEN_WIDTH-40, 1)];
        [lineLabel setBackgroundColor:[UIColor lightGrayColor]];
        [self.view addSubview:lineLabel];
        
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(20+80, 69+30+50*i, SCREEN_WIDTH-40-80, 35)];
        _textField.returnKeyType = UIReturnKeyNext;
        if (i==1) {
            _textField.frame = CGRectMake(20+80, 69+30+50*i, SCREEN_WIDTH-40-80-100, 35);
        }
        
        if (i==4) {
            _textField.returnKeyType = UIReturnKeyGo;
        }
        [self.view addSubview:_textField];
        [_textFieldArray addObject:_textField];
    }
    
    UIButton *verifyBtn = [GZRControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH-20-90, 69+80, 80, 35) ImageName:nil Target:self Action:@selector(verifyButtonClicked) Title:@"获取验证码" titleColor:RGBCOLOR(228, 35, 117) backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
    verifyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [verifyBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [self.view addSubview:verifyBtn];
    
    UIButton *showBtn = [GZRControl createButtonWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, 69+30+250, 120, 40) ImageName:nil Target:self Action:@selector(showBtnClicked) Title:@"显示选填内容" titleColor:RGBCOLOR(228, 35, 117) backColor:[UIColor clearColor] cornerRadius:0 masks:NO];
    [showBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [self.view addSubview:showBtn];
    
    UIButton *registerBtn = [GZRControl createButtonWithFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49) ImageName:nil Target:self Action:@selector(registerBtnClicked) Title:@"注 册" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:0 masks:NO];
    [self.view addSubview:registerBtn];
}

/**
 *  向服务器请求验证码
 */
- (void)verifyButtonClicked {
    
}

- (void)showBtnClicked {
    
}

- (void)registerBtnClicked {
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITextField *currentTextField in _textFieldArray) {
        [currentTextField resignFirstResponder];
        
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
