//
//  UIImage+SGCreate.m
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import "UIImage+SGCreate.h"

@implementation UIImage (SGCreate)

+ (UIImage *)fetchImageWithNameOrPath:(NSString *)imageNameOrPath {
    return [UIImage imageNamed:imageNameOrPath] ? :
    [UIImage imageWithContentsOfFile:imageNameOrPath] ;
}

+ (instancetype)imageNamed:(NSString *)imageName size:(CGSize)size {
    UIImage *image = [self imageNamed:imageName];
    
    CGRect bounds = CGRectMake(0, 0, size.width, size.height);
    
    // 开启图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);

    // 渲染图片
    [image drawInRect:bounds];
    
    // 生成UIimage
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageNamed:(NSString *)name withBundle:(NSString *)bundle {
    if ([bundle hasSuffix:@".bundle"]) {
        return [UIImage imageNamed:[NSString stringWithFormat:@"%@/%@",bundle,name]];
    }
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@.bundle/%@",bundle,name]];
}

+ (instancetype)originImageNamed:(NSString *)imageName {
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)strechImageWithImageName:(NSString *)imageName {
    return [self strechImageWithImageName:imageName leftCap:0.5 topCap:0.5];
}

+ (UIImage *)strechImageWithImageName:(NSString *)imageName leftCap:(CGFloat)leftProgress topCap:(CGFloat)topProgress {
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    return  [image stretchableImageWithLeftCapWidth:image.size.width * leftProgress topCapHeight:image.size.height * topProgress];
}


+(instancetype)fetchImageFromView:(UIView *)view {
    //应该给一个延迟的效果
    //获得图片上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    //将控制器的view的layer渲染到图层
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    //去除图片
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    //将新图片压缩成二进制文件
    return newImage;
    
}

- (instancetype)deepCopy {
    UIImage *image = self;
    UIGraphicsBeginImageContext(image.size);
    {
        [image drawAtPoint:CGPointMake(0, 0)];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return image;
}
@end
