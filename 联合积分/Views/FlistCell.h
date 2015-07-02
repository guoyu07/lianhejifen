//
//  FlistCell.h
//  联合积分
//
//  Created by arong on 15/6/30.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^sendBlock)(NSInteger tag);

@interface FlistCell : UITableViewCell
//@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
//@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;

@property (nonatomic,strong) UIImageView *leftBgImageView;
@property (nonatomic,strong) UIImageView *rightBgImageView;
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UIImageView *rightImageView;

- (void)sendValueTag:(sendBlock)block;

@end
