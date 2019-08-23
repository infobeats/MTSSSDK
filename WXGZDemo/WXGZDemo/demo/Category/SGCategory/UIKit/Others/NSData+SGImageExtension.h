//
//  NSData+SGImageExtension.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,UIImageRealType) {
    UIImageRealTypeNone,        // is not image data
    UIImageRealTypeJPEG,        // @"jpeg"
    UIImageRealTypePNG,         // @"png"
    UIImageRealTypeGIF,         // @"gif"
    UIImageRealTypeTIFF,        // @"tiff"
    UIImageRealTypeImage_WEBP,  // @"iamge/webp"
};

@interface NSData (SGImageExtension)
// 图片真实类型
@property (readonly) UIImageRealType imageRealType;

+ (NSData *)dataWithPNGImage:(UIImage *)image;
+ (NSData *)dataWithJPEGImage:(UIImage *)image compressionQuality:(CGFloat)quality;
@end
