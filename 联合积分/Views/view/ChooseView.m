//
//  ChooseView.m
//  联合积分
//
//  Created by arong on 15/7/7.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "ChooseView.h"

@implementation ChooseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        [self createUI];
    }
    return self;
}

- (void)createUI {
        
    for (int i=0; i<self.nameArray.count; i++) {
        NSArray *currentArray = self.contentArray[i];
        NSInteger indexRow = currentArray.count/3;
        UILabel *nameLabel = [GZRControl createLabelWithFrame:CGRectMake(10, 30+(40+5+5)*indexRow*i, 50, 20) Font:15 Text:[self.nameArray objectAtIndex:i] TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
        [self addSubview:nameLabel];
        
    }
    
    NSInteger btnW = (SCREEN_WIDTH-30)/3;
    for (NSArray *currentArr in self.contentArray) {
        for (int i=0; i<currentArr.count; i++) {
            UIButton *button = [GZRControl createButtonWithFrame:CGRectMake(10+i%3*(5+btnW), 55+i/3*(5+40), btnW, 40) ImageName:nil Target:self Action:@selector(buttonClicked:) Title:[currentArr objectAtIndex:i] titleColor:[UIColor blackColor] backColor:[UIColor whiteColor] cornerRadius:0 masks:NO];
            button.layer.borderColor = [[UIColor grayColor] CGColor];
            button.layer.borderWidth = 1.0;
            [self addSubview:button];
        }
    }
}

- (void)buttonClicked:(UIButton *)btn {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
