//
//  UIColor+SGHexColor.h
//  SGCategory
//
//  Created by Shangen Zhang on 16/12/13.
//  Copyright © 2016年 Shangen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HexAColor(hex,a) \
[UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 \
green:((float)((hex & 0xFF00  ) >> 8)) /255.0 \
blue:((float)( hex & 0xFF   ))        /255.0 \
alpha:a]

#define HexColor(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 \
green:((float)((hex & 0xFF00  ) >> 8)) /255.0 \
blue:((float)( hex & 0xFF   ))        /255.0 \
alpha:1]

@interface UIColor (SGHexColor)
/**
 *  16进制自动转换RGB颜色
 *
 *  @param hex (hexString)  传入16进制色值 如:0xffffff 或 @"ffffff"
 *
 *  @return 返回iOS中支持的RGB值的图片
 *
 *  注意：iOS中默认不支持16进制色值，但是在公司中或者UI美工一般都使用标准的16进制表示颜色，
 *  我们可以通过这个方法将美工给的16进制颜色进行转换就OK了
 *
 */
+ (UIColor *)colorWithHex:(int)hex;
+ (UIColor *)colorWithHexString:(NSString *)hexString;

// +透明度
+ (UIColor *)colorWithHex:(int)hex alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString
                          alpha:(CGFloat)alpha;

@end
