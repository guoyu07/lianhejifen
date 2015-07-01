//
//  CustomView.m
//  联合积分
//
//  Created by arong on 15/6/24.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 创建画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 241, 241, 241, 1.0);
    UIFont *font = [UIFont boldSystemFontOfSize:15];
    UIFont *font2 = [UIFont boldSystemFontOfSize:25];
    int i=0;
    for (NSString *str in self.strArray) {
        CGSize strSize;
        CGRect frame;
        
        if (i==1) {
            strSize = [str sizeWithFont:[UIFont boldSystemFontOfSize:25]];
            frame = CGRectMake((self.frame.size.width-strSize.width)/2, 40+40*i, strSize.width, 20);
            [str drawInRect:frame withFont:font2];
        }
        if (i==0 || i==2) {
            strSize = [str sizeWithFont:[UIFont boldSystemFontOfSize:15]];
            if (i==0) {
                frame = CGRectMake((self.frame.size.width-strSize.width)/2, 40+40*i, strSize.width, 20);
            }
            if (i==2) {
                frame = CGRectMake((self.frame.size.width-strSize.width)/2, 40+40*i+10, strSize.width, 20);
            }
            [str drawInRect:frame withFont:font];
        }
        
        i++;
    }
    
    // - - - 画图
    // 边框图
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);// 画笔的颜色
    CGContextSetLineWidth(context, 2.0);// 线的宽度
    
    // x,y 为圆点坐标 radius为半径 startAngle为开始弧度 endAngle为结束弧度 clockwise(0表示顺时针，1表示逆时针)
    //    CGContextAddArc(<#CGContextRef c#>, <#CGFloat x#>, <#CGFloat y#>, <#CGFloat radius#>, <#CGFloat startAngle#>, <#CGFloat endAngle#>, <#int clockwise#>)
    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, self.frame.size.width/2-1,0, PI*2, 0);// 这里不能通过更改角度值来达到扇形的效果
    CGContextDrawPath(context, kCGPathStroke);// 设置绘画的方式 绘制路径
}

@end
