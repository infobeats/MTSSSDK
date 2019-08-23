//
//  UIImage+SGQRCode.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SGQRCode)
/**
 生成二维码
 @param string 需要转换成二维码的字符
 @param avatar 二维码中间的小图片
 @param scale 小图片的中间的图片大小
 */
+ (void)qrImageWithString:(NSString *)string avatar:(UIImage *)avatar scale:(CGFloat)scale completion:(void (^)(UIImage *))completion;
@end
