//
//  GZRControl.m
//  联合积分
//
//  Created by arong on 15/6/24.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "GZRControl.h"

@implementation GZRControl

+ (UILabel *)createLabelWithFrame:(CGRect)frame
                             Font:(int)font
                             Text:(NSString *)text
                        TextColor:(UIColor *)textColor
                      TextAligent:(NSTextAlignment)textAligent{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
    [label setNumberOfLines:0];
    [label setTextAlignment:textAligent];
    [label setFont:[UIFont systemFontOfSize:font]];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [label setAdjustsFontSizeToFitWidth:YES];
    [label setTextColor:textColor];
    [label setText:text];
    
    return label;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame
                          ImageName:(NSString *)imageName
                             Target:(id)target
                             Action:(SEL)action
                              Title:(NSString *)title
                         titleColor:(UIColor *)titleColor
                          backColor:(UIColor *)bgColor
                       cornerRadius:(CGFloat)cornerRadius
                              masks:(BOOL)YESorNO{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundColor:bgColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.layer.masksToBounds = YESorNO;
    button.layer.cornerRadius = cornerRadius;
    
    return button;
}

+ (UIView *)viewWithFrame:(CGRect)frame {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    
    return view;
}

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame ImageName:(NSString *)imageName {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    
    [imageView setImage:[UIImage imageNamed:imageName]];
    [imageView setUserInteractionEnabled:YES];
    
    return imageView;
}

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                              placeholder:(NSString *)placeholder
                                 password:(BOOL)YESorNO
                            leftImageView:(UIImageView *)leftImageView
                           rightImageView:(UIImageView *)rightImageView
                                     Font:(float)font {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    
    [textField setPlaceholder:placeholder];
    [textField setTextAlignment:NSTextAlignmentLeft];
    [textField setSecureTextEntry:YESorNO];
    [textField setKeyboardType:UIKeyboardTypeEmailAddress];
    [textField setAutocapitalizationType:NO];
    [textField setClearButtonMode:YES];
    [textField setLeftView:leftImageView];
    [textField setLeftViewMode:UITextFieldViewModeAlways];
    [textField setRightView:rightImageView];
    [textField setRightViewMode:UITextFieldViewModeWhileEditing];
    [textField setFont:[UIFont systemFontOfSize:font]];
    [textField setTextColor:[UIColor blackColor]];
    
    return textField;
}

+ (UIScrollView *)makeScrollViewWithFrame:(CGRect)frame andSize:(CGSize)size {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    
    [scrollView setContentSize:size];
    [scrollView setPagingEnabled:YES];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [scrollView setScrollsToTop:NO];
    
    return scrollView;
}

@end
