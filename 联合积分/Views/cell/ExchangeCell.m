//
//  ExchangeCell.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/1.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "ExchangeCell.h"

@implementation ExchangeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadData:(NSIndexPath *)index
{
    
    if (index.row ==0) {
        
        self.iconImageView.image= [UIImage imageNamed:@"u233"];
        self.nameLabel.text =@"天猫";
    }
    if (index.row ==1) {
        
        self.iconImageView.image= [UIImage imageNamed:@"u438"];
        self.nameLabel.text =@"家乐福";
    }
    if (index.row ==2) {
        
        self.iconImageView.image= [UIImage imageNamed:@"u997"];
        self.nameLabel.text =@"移动";
    }
    if (index.row ==3) {
        
        self.iconImageView.image= [UIImage imageNamed:@"u221"];
        self.nameLabel.text =@"国航知音";
    }

    
    
    
}

@end
