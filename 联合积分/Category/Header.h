//
//  Header.h
//  联合积分
//
//  Created by arong on 15/6/24.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#ifndef _____Header_h
#define _____Header_h



//定义屏幕的宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//定义屏幕的高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//自定义颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
//测试打印输出
#define logdebug(format, ...) NSLog(@"%s():%d " format, __func__, __LINE__, ##__VA_ARGS__)

#endif
