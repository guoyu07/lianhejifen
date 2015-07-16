//
//  ChooseView.m
//  联合积分
//
//  Created by arong on 15/7/7.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "ChooseView.h"

@implementation ChooseView
{
    NSMutableArray *_labelArr;
    NSMutableArray *_buttonArr;
    NSMutableArray *_buttonArr1;
    UITextField    *_quantityTextField;
    NSMutableDictionary *_buttonDic;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        [self createUI];
        _labelArr = [[NSMutableArray alloc] init];
        _buttonArr = [[NSMutableArray alloc] init];
        _buttonArr1 = [[NSMutableArray alloc] init];
        _buttonDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)createUI {
    /***********创建标题显示**************/
    for (int i=0; i<self.nameArray.count; i++) {
        NSArray *currentArray;
        if (i>0) {
            currentArray = self.contentArray[i-1];
        }
        NSInteger indexRow;
        if (currentArray.count <= 3) {
            indexRow = 1;
        } else if (currentArray.count > 3 && currentArray.count <= 6) {
            indexRow = 2;
        }
        UILabel *nameLabel = [GZRControl createLabelWithFrame:CGRectMake(10, 30+(20+(40*indexRow+5+5))*i, 50, 20) Font:15 Text:[self.nameArray objectAtIndex:i] TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
        if (i>0) {
            UILabel *currentLabel = _labelArr[i-1];
            nameLabel.frame = CGRectMake(10, CGRectGetMaxY(currentLabel.frame)+40*indexRow+5*(indexRow+1), 50, 20);
        }
        [self addSubview:nameLabel];
        [_labelArr addObject:nameLabel];
        
    }
    
    /*************创建选择按钮***************/
    NSInteger btnW = (SCREEN_WIDTH-30)/3;
    NSInteger row = self.contentArray.count;
    for (int j=0; j<row; j++) {
        NSArray *currentArr = self.contentArray[j];
        UILabel *currentLabel = [_labelArr objectAtIndex:j];
        if (j==0) {
            for (int i=0; i<currentArr.count; i++) {
                UIButton *button = [GZRControl createButtonWithFrame:CGRectMake(10+i%3*(5+btnW), (CGRectGetMaxY(currentLabel.frame)+5)+i/3*(5+40), btnW, 40) ImageName:nil Target:self Action:@selector(buttonClicked:) Title:[currentArr objectAtIndex:i] titleColor:[UIColor blackColor] backColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
                [button setBackgroundImage:[UIImage imageNamed:@"btnBg"] forState:UIControlStateSelected];
                button.layer.borderColor = [[UIColor grayColor] CGColor];
                button.layer.borderWidth = 1.0;
                button.tag = 111 + i;
                [_buttonArr addObject:button];
                [self addSubview:button];
            }
        } else {
            for (int i=0; i<currentArr.count; i++) {
                UIButton *button = [GZRControl createButtonWithFrame:CGRectMake(10+i%3*(5+btnW), (CGRectGetMaxY(currentLabel.frame)+5)+i/3*(5+40), btnW, 40) ImageName:nil Target:self Action:@selector(buttonClicked:) Title:[currentArr objectAtIndex:i] titleColor:[UIColor blackColor] backColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
                [button setBackgroundImage:[UIImage imageNamed:@"btnBg"] forState:UIControlStateSelected];
                button.layer.borderColor = [[UIColor grayColor] CGColor];
                button.layer.borderWidth = 1.0;
                button.tag = 222 + i;
                [_buttonArr1 addObject:button];
                [self addSubview:button];
            }
        }
        
    }
    
    /**************创建数量选择视图****************/
    UILabel *currentLabel = [_labelArr lastObject];
    NSArray *symbolArr  = [NSArray arrayWithObjects:@"-",@"+", nil];
    for (int i=0; i<2; i++) {
        UIButton *calculateBtn = [GZRControl createButtonWithFrame:CGRectMake(10+(50+80)*i, CGRectGetMaxY(currentLabel.frame)+5, 50, 40) ImageName:nil Target:self Action:@selector(calculateBtnClicked:) Title:[symbolArr objectAtIndex:i] titleColor:[UIColor blackColor] backColor:RGBCOLOR(227, 228, 229) cornerRadius:0 masks:NO];
        [calculateBtn setTitleColor:RGBCOLOR(228, 35, 117) forState:UIControlStateHighlighted];
        calculateBtn.layer.borderColor = [[UIColor grayColor] CGColor];
        calculateBtn.layer.borderWidth = 1.0;
        calculateBtn.tag = 999 + i;
        [self addSubview:calculateBtn];
    }
    
    _quantityTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, CGRectGetMaxY(currentLabel.frame)+5, 80, 40)];
    _quantityTextField.userInteractionEnabled = NO;
    _quantityTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    _quantityTextField.layer.borderWidth = 1.0;
    _quantityTextField.backgroundColor = [UIColor whiteColor];
    _quantityTextField.textAlignment = NSTextAlignmentCenter;
    _quantityTextField.text = @"1";
    [self addSubview:_quantityTextField];
    
    UIButton *confirmBtn = [GZRControl createButtonWithFrame:CGRectMake(0, CGRectGetMaxY(_quantityTextField.frame)+20, SCREEN_WIDTH, 49) ImageName:nil Target:self Action:@selector(confirmBtnClicked) Title:@"确 定" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:0 masks:NO];
    [self addSubview:confirmBtn];
    
    if ([self.delegate respondsToSelector:@selector(makeViewRectY:)]) {
        [self.delegate makeViewRectY:CGRectGetMaxY(confirmBtn.frame)];
    }
}

/**
 *  选择分类
 *
 *  @param btn <#btn description#>
 */
- (void)buttonClicked:(UIButton *)btn {
    
    if (btn.tag < 222) {
        for (UIButton *currentBtn in _buttonArr) {
            if (currentBtn.tag == btn.tag) {
                currentBtn.selected = YES;
            } else {
                currentBtn.selected = NO;
            }
        }
    } else {
        for (UIButton *currentBtn1 in _buttonArr1) {
            if (currentBtn1.tag == btn.tag) {
                currentBtn1.selected = YES;
            } else {
                currentBtn1.selected = NO;
            }
        }
    }
    
}

- (void)calculateBtnClicked:(UIButton *)btn {
    if (btn.tag-999 == 0) { // 数量减1
        if ([_quantityTextField.text intValue] > 1) { // 判断数量是否大于零
            _quantityTextField.text = [NSString stringWithFormat:@"%d",[_quantityTextField.text intValue]-1];
        }
    } else if ([_quantityTextField.text intValue] < 5){ // 数量加1
        _quantityTextField.text = [NSString stringWithFormat:@"%d",[_quantityTextField.text intValue]+1];
    } else if ([_quantityTextField.text intValue] >= 5) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"数量超出范围" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

// 确定并提交所选择的信息字典
- (void)confirmBtnClicked {
    
    if ([self.delegate respondsToSelector:@selector(confirmAndgetInformation:)]) {
        [self.delegate confirmAndgetInformation:nil];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
