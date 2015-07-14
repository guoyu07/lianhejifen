//
//  ShopView.h
//  联合积分
//
//  Created by arong on 15/7/10.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  自定义商家信息展示视图
 */
@interface ShopView : UIView

@property (nonatomic,copy) NSString *shopName;      // 商店名称
@property (nonatomic,copy) NSString *shopLocation;  // 商店位置
@property (nonatomic,copy) NSString *shopDistance;  // 商店距离

- (instancetype)initWithFrame:(CGRect)frame;

- (void)createShopCell;

@end
