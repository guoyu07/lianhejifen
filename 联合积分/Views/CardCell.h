//
//  CardCell.h
//  联合积分
//
//  Created by kaifabu－2 on 15/6/29.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardModel.h"

@protocol MyProtocalDelegate;

@interface CardCell : UITableViewCell

-(void)loadData:(CardModel *)model index:(NSIndexPath*)index;

@property(nonatomic,assign) id<MyProtocalDelegate>   delegate;



@end
@protocol MyProtocalDelegate <NSObject>
//选择实现方法
@optional
-(void)leftButtonClick;
-(void)rightButtonClick;

@end