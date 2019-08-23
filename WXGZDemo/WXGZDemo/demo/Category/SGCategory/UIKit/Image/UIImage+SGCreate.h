//
//  UIImage+SGCreate.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SGCreate)

/**
 获取图片

 @param imageNameOrPath 容错参数  可以是全路径可以是imageName
 @return UIImage
 */
+ (UIImage *)fetchImageWithNameOrPath:(NSString *)imageNameOrPath;


/**
 根据 size 大小获取图片
 -- 原始图片可能是大图可空间只要小图即可 节省内存空间

 @param imageName 图片名称
 @param size 需要的大小
 @return image
 */
+ (instancetype)imageNamed:(NSString *)imageName size:(CGSize)size;



/**
 *  根据图片名获取一张原始图片（不被渲染的）
 */
+ (UIImage *)originImageNamed:(NSString *)imageName;


/**
 *  获取拉伸图片
 */
+ (UIImage *)strechImageWithImageName:(NSString *)imageName;
+ (UIImage *)strechImageWithImageName:(NSString *)imageName
                              leftCap:(CGFloat)leftProgress
                               topCap:(CGFloat)topProgress;

/**
 * bundle 中加载图片
 */
+ (UIImage *)imageNamed:(NSString *)name withBundle:(NSString *)bundle;


/**
 * 截取view的图片
 */
+ (UIImage *)fetchImageFromView:(UIView *)view;

/**
 * 复制图片
 */
- (UIImage *)deepCopy;
@end
