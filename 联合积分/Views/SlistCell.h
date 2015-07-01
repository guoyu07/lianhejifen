//
//  SlistCell.h
//  联合积分
//
//  Created by arong on 15/6/30.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlistCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cornerImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end
