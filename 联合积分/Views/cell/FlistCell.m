//
//  FlistCell.m
//  联合积分
//
//  Created by arong on 15/6/30.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "FlistCell.h"

@implementation FlistCell
{
    sendBlock _block;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    self.leftBgImageView = [[UIImageView alloc] init];
    [self.leftBgImageView setFrame:CGRectMake(5, 5, (SCREEN_WIDTH-15)/2, (SCREEN_WIDTH-15)/2)];
    [self.leftBgImageView setImage:[UIImage imageNamed:@"u50.png"]];
    self.rightBgImageView = [[UIImageView alloc] init];
    [self.rightBgImageView setFrame:CGRectMake(CGRectGetMaxX(self.leftBgImageView.frame)+5, 5, (SCREEN_WIDTH-15)/2, (SCREEN_WIDTH-15)/2)];
    [self.rightBgImageView setImage:[UIImage imageNamed:@"u50.png"]];
    [self addSubview:self.leftBgImageView];
    [self addSubview:self.rightBgImageView];
    
    self.leftImageView = [[UIImageView alloc] init];
    [self.leftImageView setFrame:CGRectMake(5, 5, (SCREEN_WIDTH-15)/2-5, (SCREEN_WIDTH-15)/2-5)];
    self.leftImageView.tag = 89;
    self.rightImageView = [[UIImageView alloc] init];
    [self.rightImageView setFrame:CGRectMake(CGRectGetMaxX(self.leftBgImageView.frame)+5, 5, (SCREEN_WIDTH-15)/2-5, (SCREEN_WIDTH-15)/2-5)];
    self.rightImageView.tag = 98;
    [self addSubview:self.leftImageView];
    [self addSubview:self.rightImageView];
}

- (void)sendValueTag:(sendBlock)block {
    if (_block != block) {
        _block = nil;
        _block = block;
    }
    self.leftImageView.userInteractionEnabled = YES;
    self.rightImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *leftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(intoVC:)];
    [self.leftImageView addGestureRecognizer:leftTap];
    UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(intoVC:)];
    [self.rightImageView addGestureRecognizer:rightTap];
}

- (void)intoVC:(UITapGestureRecognizer *)tap {
    if (tap.view.tag == 89) {
        _block(89);
    } else if (tap.view.tag == 98) {
        _block(98);
    }
    
}

@end
