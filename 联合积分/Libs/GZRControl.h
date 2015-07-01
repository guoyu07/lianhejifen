//
//  GZRControl.h
//  联合积分
//
//  Created by arong on 15/6/24.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GZRControl : NSObject

#pragma mark -- 创建Label
+ (UILabel *)createLabelWithFrame:(CGRect)frame
                             Font:(int)font
                             Text:(NSString *)text
                        TextColor:(UIColor *)textColor
                      TextAligent:(NSTextAlignment)textAligent;
#pragma mark -- 创建View 
+ (UIView *)viewWithFrame:(CGRect)frame;
#pragma mark -- 创建ImageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame ImageName:(NSString *)imageName;
#pragma mark -- 创建Button
+ (UIButton *)createButtonWithFrame:(CGRect)frame
                          ImageName:(NSString *)imageName
                             Target:(id)target
                             Action:(SEL)action
                              Title:(NSString *)title
                         titleColor:(UIColor *)titleColor
                          backColor:(UIColor *)bgColor
                       cornerRadius:(CGFloat)cornerRadius
                              masks:(BOOL)YESorNO;
#pragma mark -- 创建UITextfield
+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                              placeholder:(NSString *)placeholder
                                 password:(BOOL)YESorNO
                            leftImageView:(UIImageView *)leftImageView
                           rightImageView:(UIImageView *)rightImageView
                                     Font:(float)font;
#pragma mark -- 创建UIScrollView
+ (UIScrollView *)makeScrollViewWithFrame:(CGRect)frame andSize:(CGSize)size;

@end
