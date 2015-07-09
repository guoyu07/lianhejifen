//
//  ChooseView.h
//  联合积分
//
//  Created by arong on 15/7/7.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseView : UIView

@property (nonatomic,strong) NSMutableArray *nameArray;

@property (nonatomic,strong) NSMutableArray *contentArray;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)createUI;

@end
