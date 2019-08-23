//
//  UIView+SGCorners.h
//  SGCategory
//
//  Created by Shangen Zhang on 16/10/31.
//  Copyright © 2016年 Shangen zhang. All rights reserved.
//
// 设置特定的某个角的圆角

#import <UIKit/UIKit.h>

@interface UIView (SGCorners)
// 圆角半径
@property (assign) CGFloat cornerRadius;

/**
 *  设置自定义圆角

 @param rectCorner  圆角位置
 @param cornerRadii 圆角大小
 */
- (void)setCorners:(UIRectCorner)rectCorner
       cornerRadii:(CGFloat)cornerRadii;

@end
