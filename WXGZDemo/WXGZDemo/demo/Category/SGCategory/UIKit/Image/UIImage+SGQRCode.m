//
//  UIImage+SGQRCode.m
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import "UIImage+SGQRCode.h"

@implementation UIImage (SGQRCode)

+ (void)qrImageWithString:(NSString *)string avatar:(UIImage *)avatar scale:(CGFloat)scale completion:(void (^)(UIImage *))completion
{
    
    NSAssert(completion != nil, @"必须传入完成回调");
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
        
        [qrFilter setDefaults];
        [qrFilter setValue:[string dataUsingEncoding:NSUTF8StringEncoding] forKey:@"inputMessage"];
        
        CIImage *ciImage = qrFilter.outputImage;
        
        CGAffineTransform transform = CGAffineTransformMakeScale(10, 10);
        CIImage *transformedImage = [ciImage imageByApplyingTransform:transform];
        
        CIContext *context = [CIContext contextWithOptions:nil];
        CGImageRef cgImage = [context createCGImage:transformedImage fromRect:transformedImage.extent];
        UIImage *qrImage = [UIImage imageWithCGImage:cgImage scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
        CGImageRelease(cgImage);
        
        if (avatar != nil) {
            qrImage = [self qrcodeImage:qrImage addAvatar:avatar scale:scale];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{ completion(qrImage); });
    });
}

+ (UIImage *)qrcodeImage:(UIImage *)qrImage addAvatar:(UIImage *)avatar scale:(CGFloat)scale {
    
    CGFloat screenScale = [UIScreen mainScreen].scale;
    CGRect rect = CGRectMake(0, 0, qrImage.size.width * screenScale, qrImage.size.height * screenScale);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, screenScale);
    
    [qrImage drawInRect:rect];
    
    CGSize avatarSize = CGSizeMake(rect.size.width * scale, rect.size.height * scale);
    CGFloat x = (rect.size.width - avatarSize.width) * 0.5;
    CGFloat y = (rect.size.height - avatarSize.height) * 0.5;
    [avatar drawInRect:CGRectMake(x, y, avatarSize.width, avatarSize.height)];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return [UIImage imageWithCGImage:result.CGImage scale:screenScale orientation:UIImageOrientationUp];
}

@end
