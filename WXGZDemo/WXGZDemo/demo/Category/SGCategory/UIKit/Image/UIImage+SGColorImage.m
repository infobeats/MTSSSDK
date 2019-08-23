//
//  UIImage+SGColorImage.m
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import "UIImage+SGColorImage.h"

@implementation UIImage (SGColorImage)
// 根据一个颜色生成一张1*1的图片
+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1.0f, 1.0f)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, UIScreen.mainScreen.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

+ (UIImage *)innerRoundImageWithColor:(UIColor *)color size:(CGSize)size {
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, UIScreen.mainScreen.scale);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
   
    // CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    
     // 使用color演示填充上下文
    CGFloat minWidth = MIN(size.width,size.height);
    CGRect inRect = CGRectMake((size.width - minWidth) * 0.5, (size.height - minWidth) * 0.5, minWidth, minWidth);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:inRect cornerRadius:minWidth * 0.5];
    [color setFill];
    [path fill];
    
    // 渲染上下文
    CGContextFillRect(context, rect);
    
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}
@end
