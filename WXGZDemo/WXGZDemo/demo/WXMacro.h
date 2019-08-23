//
//  WXMacro.h
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 29/7/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#ifndef WXMacro_h
#define WXMacro_h


#import <UIKit/UIKit.h>

// 屏幕宽高
#define kHLScreenFrame      [[UIScreen mainScreen] bounds]
#define kHLScreenFrameSize  [[UIScreen mainScreen] bounds].size

#define kHLScreenFrameWidth  kHLScreenFrameSize.width
#define kHLScreenFrameHeight kHLScreenFrameSize.height

// 屏幕缩放比例
#define kHLScreenScal [UIScreen mainScreen].scale
//字体
#define DevSystemFontOfSize(size) [UIFont systemFontOfSize:size]
#define DevBoldHLSystemFontOfSize(size) [UIFont boldSystemFontOfSize:size]


//背景色
#define WXBackColor [UIColor colorWithRed:244/255.0 green:246/255.0 blue:248/255.0 alpha:1.0]

#endif /* WXMacro_h */
