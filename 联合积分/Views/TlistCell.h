//
//  TlistCell.h
//  联合积分
//
//  Created by arong on 15/6/30.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TlistCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;  // 填充背景颜色
@property (weak, nonatomic) IBOutlet UILabel     *titleLabel;   // 标题
@property (weak, nonatomic) IBOutlet UILabel     *sourceLabel;  // 送积分

@end
