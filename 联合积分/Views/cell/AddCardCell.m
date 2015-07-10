//
//  AddCardCell.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/2.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "AddCardCell.h"

@implementation AddCardCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)loadBgView
{
    
    UIImageView *bgImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    bgImageView.userInteractionEnabled =YES;
    
    bgImageView.image =[UIImage imageNamed:@"bg"];
    [self.contentView addSubview:bgImageView];

    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
