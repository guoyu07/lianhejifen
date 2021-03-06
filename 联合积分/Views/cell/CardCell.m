//
//  CardCell.m
//  联合积分
//
//  Created by kaifabu－2 on 15/6/29.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "CardCell.h"

@implementation CardCell
{
    
    UIImageView *iconImageView;
    
    UILabel *cardNameLabel;
    
    UILabel *cardNumLabel;
    
    
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
   
    
    
}


-(void)loadData:(CardModel *)model index:(NSIndexPath*)index
{
    for ( UIView *view in self.contentView.subviews) {
        
        [view removeFromSuperview];
        
    }
    UIImageView *bgImageView =[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH-10    , 110)];
    bgImageView.userInteractionEnabled =YES;
    
    bgImageView.image =[UIImage imageNamed:@"bg"];
    [self.contentView addSubview:bgImageView];
    
    self.contentView.layer.shadowColor =(__bridge CGColorRef)([UIColor blackColor]);
    self.contentView.layer.shadowOffset =CGSizeMake(3, 3);
    self.contentView.layer.shadowOpacity = 0.5;//不透明度
    
    iconImageView =[[UIImageView alloc]init];
    iconImageView.frame =CGRectMake(10, 20, 30, 30);
    [bgImageView addSubview:iconImageView];
    if (index.row ==0) {
        iconImageView.image =[UIImage imageNamed:@"u251"];
    }
    if (index.row ==1) {
        iconImageView.image =[UIImage imageNamed:@"u221"];
    }
    if (index.row ==2) {
        iconImageView.image =[UIImage imageNamed:@"u233"];
    }
    if (index.row ==3) {
        iconImageView.image =[UIImage imageNamed:@"u997"];
    }
    
    cardNameLabel =[[UILabel alloc]init];
    cardNameLabel.frame =CGRectMake(50, 25,120 ,25 );
    [bgImageView addSubview:cardNameLabel];
    
    cardNumLabel =[[UILabel alloc]init];
    cardNumLabel.frame =CGRectMake(SCREEN_WIDTH-100, 25,120 , 25);
    [bgImageView addSubview:cardNumLabel];

    cardNameLabel.text =model.cardName;
    cardNumLabel.text =model.cardNum;

    if (index.row==0) {
        
       [bgImageView addSubview: [GZRControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH -230, 70,100 , 30) ImageName:@"" Target:self Action:@selector(leftButtonClick:) Title:@"转赠" titleColor:[UIColor blackColor] backColor:[UIColor whiteColor] cornerRadius:15 masks:YES]];
        
        
       [bgImageView addSubview: [GZRControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH -120, 70,100 , 30) ImageName:@"" Target:self Action:@selector(rightButtonClick:) Title:@"转出积分" titleColor:[UIColor blackColor] backColor:[UIColor whiteColor] cornerRadius:15 masks:YES]];
        
    }
    else
    {
         [bgImageView addSubview: [GZRControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH -170, 70,150 , 30) ImageName:@"" Target:self Action:@selector(exchangeClick:) Title:@"转为联合积分" titleColor:[UIColor whiteColor] backColor:RGBCOLOR(228, 35, 117) cornerRadius:15 masks:YES]];
        
        
    }
    
    
}


-(void)leftButtonClick:(UIButton * )btn
{
    [self.delegate leftButtonClick];
    
}

-(void)rightButtonClick:(UIButton *)btn
{
    
    [self.delegate rightButtonClick];
    
    
}

-(void)exchangeClick:(UIButton * )btn
{
    [self.delegate exchange];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
