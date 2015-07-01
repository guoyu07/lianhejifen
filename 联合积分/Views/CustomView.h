//
//  CustomView.h
//  联合积分
//
//  Created by arong on 15/6/24.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PI 3.1415926

@interface CustomView : UIView

@property (nonatomic,copy) NSString *titleString;   // 模块标题
@property (nonatomic,copy) NSString *markString;    // 分数
@property (nonatomic,copy) NSString *priceString;   // 价格

@property (nonatomic,retain) NSArray *strArray;     // 存放三个显示字符串


@end
