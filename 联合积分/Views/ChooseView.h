//
//  ChooseView.h
//  联合积分
//
//  Created by arong on 15/7/7.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChooseViewDelegate <NSObject>

@required
- (void)makeViewRectY:(NSInteger)rectY;

- (void)confirmAndgetInformation:(NSDictionary *)infoDic;

@end

@interface ChooseView : UIView

@property (nonatomic,strong) NSMutableArray *nameArray;

@property (nonatomic,strong) NSMutableArray *contentArray;

@property (nonatomic,weak) id<ChooseViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)createUI;

@end
