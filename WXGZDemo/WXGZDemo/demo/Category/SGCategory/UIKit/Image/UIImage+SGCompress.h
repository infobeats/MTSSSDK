//
//  UIImage+SGCompress.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SGCompress)
// 适配到某个尺寸下 不会越界
- (UIImage*)aspectToSize:(CGSize)size;
// 适配到某个尺寸下 可能会越界
- (UIImage*)aspectFitToSize:(CGSize)size;

// 填充到某个尺寸
- (UIImage*)aspectFillToSize:(CGSize)size;
- (UIImage*)aspectFillToSize:(CGSize)size offset:(CGFloat)offset;


/**
 *  压缩、放大图片
 */
- (UIImage *)compressImageWithTargetWidth:(CGFloat)targetWidth;
- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (NSData *)compressImageToMaxFileSize:(NSInteger)maxFileSize;



@end
