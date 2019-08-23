//
//  UIImage+SGFix.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SGFix)
/**
 * 重新设置图片的方向,防止上传到服务器,图片方向错误
 */
- (UIImage *)fixOrientation;
@end
