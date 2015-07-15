//
//  ShopView.m
//  联合积分
//
//  Created by arong on 15/7/10.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "ShopView.h"

@implementation ShopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)createShopCell {
    UILabel *nameLabel = [GZRControl createLabelWithFrame:CGRectMake(20, 5, 200, 20) Font:15 Text:self.shopName TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
    [self addSubview:nameLabel];
    
    UILabel *locationLabel = [GZRControl createLabelWithFrame:CGRectMake(20, 35, 200, 20) Font:15 Text:self.shopLocation TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentLeft];
    [self addSubview:locationLabel];
    
    UILabel *distanceLabel = [GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH-100, 35, 80, 20) Font:15 Text:self.shopDistance TextColor:[UIColor grayColor] TextAligent:NSTextAlignmentRight];
    [self addSubview:distanceLabel];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
