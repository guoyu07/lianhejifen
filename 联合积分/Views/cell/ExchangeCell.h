//
//  ExchangeCell.h
//  联合积分
//
//  Created by kaifabu－2 on 15/7/1.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExchangeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

-(void)loadData:(NSIndexPath *)index;

@end
