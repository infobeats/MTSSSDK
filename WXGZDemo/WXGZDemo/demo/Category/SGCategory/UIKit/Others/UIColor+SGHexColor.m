//
//  UIColor+SGHexColor.m
//  SGCategory
//
//  Created by Shangen Zhang on 16/12/13.
//  Copyright © 2016年 Shangen Zhang. All rights reserved.
//

#import "UIColor+SGHexColor.h"

@implementation UIColor (SGHexColor)
+ (UIColor *)colorWithHex:(int)hex {
    return [self colorWithHex:hex alpha:1.0];
}

+ (UIColor *)colorWithHex:(int)hex alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0xFF00  ) >> 8)) /255.0
                            blue:((float)( hex & 0xFF   ))        /255.0
                           alpha:alpha];
}
    /**
     *  16进制自动转换RGB颜色
     *
     *  @param stringToConvert   传入16进制色值
     *
     *  @return 返回iOS中支持的RGB值
     *
     *  注意：iOS中默认不支持16进制色值，但是在公司中或者UI美工一般都使用标准的16进制表示颜色，
     *  我们可以通过这个方法将美工给的16进制颜色进行转换就OK了
     *
     */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha
    {
        NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        
        // String should be 6 or 8 characters
        if ([cString length] < 6) return [UIColor whiteColor];
        
        // strip 0X if it appears
        if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
        else if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
        if ([cString length] != 6) return [UIColor whiteColor];
        // Separate into r, g, b substrings
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *rString = [cString substringWithRange:range];
        
        range.location = 2;
        NSString *gString = [cString substringWithRange:range];
        
        range.location = 4;
        NSString *bString = [cString substringWithRange:range];
        
        // Scan values
        unsigned int r, g, b;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:((float) r / 255.0f)
                               green:((float) g / 255.0f)
                                blue:((float) b / 255.0f)
                               alpha:alpha];
    }
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    return [self colorWithHexString:stringToConvert alpha:1.0f];
}
@end
