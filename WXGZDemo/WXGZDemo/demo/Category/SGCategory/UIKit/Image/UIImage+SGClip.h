//
//  UIImage+SGClip.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SGClip)
// 截取图片部分的内容
- (UIImage*)clipImageAtRect:(CGRect)rect;

// 截取圆图片
- (UIImage *)roundImage;

// 截取一个圆形图片并加上外框
- (UIImage *)roundImageAddOutBorderWithWidth:(CGFloat)borderW color:(UIColor *)borderColor;

// 截取一个圆形图片并加上内框
- (UIImage *)roundImageAddInsideBorderWithWidth:(CGFloat)borderW color:(UIColor *)borderColor;
@end
