//
//  ParentsView.m
//  联合积分
//
//  Created by arong on 15/7/30.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "ParentsView.h"

@implementation ParentsView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint hitPoint  = [_buttonView convertPoint:point fromView:self];
    CGPoint hitPoint1 = [_buttonView1 convertPoint:point fromView:self];
    CGPoint hitPoint2 = [_buttonView2 convertPoint:point fromView:self];
    CGPoint hitPoint3 = [_buttonView3 convertPoint:point fromView:self];
    CGPoint hitPoint4 = [_buttonView4 convertPoint:point fromView:self];
    if ([_buttonView pointInside:hitPoint withEvent:event]) {
        return _buttonView;
    } else if ([_buttonView1 pointInside:hitPoint1 withEvent:event]) {
        return _buttonView1;
    } else if ([_buttonView2 pointInside:hitPoint2 withEvent:event]) {
        return _buttonView2;
    } else if ([_buttonView3 pointInside:hitPoint3 withEvent:event]) {
        return _buttonView3;
    } else if ([_buttonView4 pointInside:hitPoint4 withEvent:event]) {
        return _buttonView4;
    } else {
        return [super hitTest:point withEvent:event];
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
