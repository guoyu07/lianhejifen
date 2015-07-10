//
//  GoodsCell.m
//  联合积分
//
//  Created by kaifabu－2 on 15/6/30.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "GoodsCell.h"

@implementation GoodsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadData:(GoodsModel *)item
{
    //self.iconImageView.image =[UIImage imageNamed:@"u303"];
    
    self.titleLabel.text =item.goodsName;
    
    self.numLabel.text =[NSString stringWithFormat:@"数量:%@",item.goodsNum];
    self.colorLabel.text =[NSString stringWithFormat:@"颜色:%@",item.goodsColor];
    self.integralLabel.text =[NSString stringWithFormat:@"积分:%@", item.integral];
    
    
}

@end
