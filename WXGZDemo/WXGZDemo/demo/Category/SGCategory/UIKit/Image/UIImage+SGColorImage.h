//
//  UIImage+SGColorImage.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SGColorImage)
/**
 * 生成纯颜色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

//  生成纯色 在size中内圆半径的圆 的图片
+ (UIImage *)innerRoundImageWithColor:(UIColor *)color size:(CGSize)size;
@end
