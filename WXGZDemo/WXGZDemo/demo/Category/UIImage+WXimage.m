//
//  UIImage+WXimage.m
//  IDataVisibleBurialPointSDKTestDemo
//
//  Created by 谭建中 on 9/4/2019.
//  Copyright © 2019 devstore. All rights reserved.
//

#import "UIImage+WXimage.h"

@implementation UIImage (WXimage)
//介绍一种方法,可以根据颜色生成图片
#pragma mark - 根据颜色获取图片
+ (UIImage *)wx_createImageWithColor:(UIColor *)color
{
    //图片尺寸
    CGRect rect = CGRectMake(0, 0, 10, 10);
    //填充画笔
    UIGraphicsBeginImageContext(rect.size);
    //根据所传颜色绘制
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    //显示区域
    CGContextFillRect(context, rect);
    // 得到图片信息
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //消除画笔
    UIGraphicsEndImageContext();
    return image;
}
@end
