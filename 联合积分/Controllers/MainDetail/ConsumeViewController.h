//
//  ConsumeViewController.h
//  联合积分
//
//  Created by arong on 15/7/2.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import <UIKit/UIKit.h>

// 积分消费
@interface ConsumeViewController : UIViewController

@property (nonatomic,copy) NSString *titleName;
// 判断是否是代金券内容
@property (nonatomic,assign) BOOL isVouchers;

@property (nonatomic,assign) NSInteger flageIndex;

@end
