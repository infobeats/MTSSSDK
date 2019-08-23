//
//  UIImage+SGClip.m
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import "UIImage+SGClip.h"

@implementation UIImage (SGClip)
- (UIImage*)clipImageAtRect:(CGRect)rect {
    CGPoint origin = CGPointMake(-rect.origin.x, -rect.origin.y);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(rect.size.width, rect.size.height), NO, UIScreen.mainScreen.scale);
    [self drawAtPoint:origin];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


- (UIImage *)roundImage {
    CGSize size = self.size;
    
    //UIGraphicsBeginImageContext(size);
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    //4.绘制一个大圆0
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    
    [path fill];
    //5.设置裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    //6.把路径设置成裁剪区域
    [clipPath addClip];
    
    //7.把图片绘制到上下文当中
    [self drawAtPoint:CGPointZero];
    
    //8.从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //9.关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)roundImageAddOutBorderWithWidth:(CGFloat)borderW color:(UIColor *)borderColor {

    CGSize size = CGSizeMake(self.size.width + 2 * borderW, self.size.height + 2 * borderW);
    
    //3.开启一个位图上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    
    //4.绘制一个大圆0
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [path fill];
    //5.设置裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, self.size.width, self.size.height)];
    //6.把路径设置成裁剪区域
    [clipPath addClip];
    
    //7.把图片绘制到上下文当中
    [self drawAtPoint:CGPointMake(borderW, borderW)];
    //8.从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //9.关闭上下文
    UIGraphicsEndImageContext();
    
    
    CGRect drawRect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    drawRect.size.width *= [UIScreen mainScreen].scale - 1;
    drawRect.size.height *= [UIScreen mainScreen].scale - 1;
    // 9.生成CG图片
    CGImageRef CGImage = CGImageCreateWithImageInRect(newImage.CGImage, drawRect);
    // 10.转化为OC图片
    newImage = [UIImage imageWithCGImage:CGImage];
    
    
    return newImage;
}

- (UIImage *)roundImageAddInsideBorderWithWidth:(CGFloat)borderW color:(UIColor *)borderColor {
    
    CGSize size = self.size;
    //CGSize size = CGSizeMake(self.size.width + 2 * borderW, self.size.height + 2 * borderW);
    
    //3.开启一个位图上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    
    //4.绘制一个大圆0
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [path fill];
    
    CGRect clipRect = CGRectMake(borderW, borderW, size.width - 2 * borderW, size.height - 2 * borderW);
    //5.设置裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipRect];
    //6.把路径设置成裁剪区域
    [clipPath addClip];
    
    //7.把图片绘制到上下文当中
    [self drawAtPoint:CGPointMake(borderW, borderW)];
    //8.从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //9.关闭上下文
    UIGraphicsEndImageContext();
    
    
    CGRect drawRect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    drawRect.size.width *= [UIScreen mainScreen].scale - 1;
    drawRect.size.height *= [UIScreen mainScreen].scale - 1;
    // 9.生成CG图片
    CGImageRef CGImage = CGImageCreateWithImageInRect(newImage.CGImage, drawRect);
    // 10.转化为OC图片
    newImage = [UIImage imageWithCGImage:CGImage];
    
    
    return newImage;
}
@end
