//
//  UIImage+SGCompose.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SGCompose)
/**
 * 与另一张图片合成一张图片
 */
- (UIImage *)maskImageWithOtherImage:(UIImage*)maskImage;


/**
 * 添加毛玻璃效果 图片
 *
 * blurLevel 模糊程度 0 ≤ t ≤ 1
 */
- (UIImage *)gaussBlur:(CGFloat)blurLevel;

/**
 *  将彩色图片转化为灰色图片
 */
- (UIImage *)convertImageToGreyScale;

/**
 *  图片加蒙版
 */
- (UIImage *)imageWithOverlayColor:(UIColor *)overlayColor;

/**
 *  图片加水印
 */
- (UIImage *)waterImageWithLogo:(UIImage *)logoImage atRect:(CGRect)frame;
@end
