//
//  GoodsCell.h
//  联合积分
//
//  Created by kaifabu－2 on 15/6/30.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
@interface GoodsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;

@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@property (weak, nonatomic) IBOutlet UILabel *integralLabel;

-(void)loadData:(GoodsModel *)item;

@end
