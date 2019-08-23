//
//  UIImage+SGCompose.m
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import "UIImage+SGCompose.h"
#import <Accelerate/Accelerate.h>


@implementation UIImage (SGCompose)
- (UIImage*)maskImageWithOtherImage:(UIImage*)maskImage
{
    CGImageRef maskCGImage = maskImage.CGImage;
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskCGImage),
                                        CGImageGetHeight(maskCGImage),
                                        CGImageGetBitsPerComponent(maskCGImage),
                                        CGImageGetBitsPerPixel(maskCGImage),
                                        CGImageGetBytesPerRow(maskCGImage),
                                        CGImageGetDataProvider(maskCGImage), NULL, false);
    
    CGImageRef masked = CGImageCreateWithMask(self.CGImage, mask);
    
    UIImage *result = [UIImage imageWithCGImage:masked];
    
    CGImageRelease(maskCGImage);
    CGImageRelease(mask);
    CGImageRelease(masked);
    
    return result;
}

- (UIImage*)gaussBlur:(CGFloat)blurLevel
{
    blurLevel = MIN(1.0, MAX(0.0, blurLevel));
    
    int boxSize = (int)(blurLevel * 0.1 * MIN(self.size.width, self.size.height));
    boxSize = boxSize - (boxSize % 2) + 1;
    
    NSData *imageData = UIImageJPEGRepresentation(self, 1);
    UIImage *tmpImage = [UIImage imageWithData:imageData];
    
    CGImageRef img = tmpImage.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    
    //create vImage_Buffer with data from CGImageRef
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    NSInteger windowR = boxSize/2;
    CGFloat sig2 = windowR / 3.0;
    if(windowR>0){ sig2 = -1/(2*sig2*sig2); }
    
    int16_t *kernel = (int16_t*)malloc(boxSize*sizeof(int16_t));
    int32_t  sum = 0;
    for(NSInteger i=0; i<boxSize; ++i){
        kernel[i] = 255*exp(sig2*(i-windowR)*(i-windowR));
        sum += kernel[i];
    }
    
    // convolution
    error = vImageConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, kernel, boxSize, 1, sum, NULL, kvImageEdgeExtend);
    error = vImageConvolve_ARGB8888(&outBuffer, &inBuffer, NULL, 0, 0, kernel, 1, boxSize, sum, NULL, kvImageEdgeExtend);
    outBuffer = inBuffer;
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGBitmapAlphaInfoMask & kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGImageRelease(imageRef);
    
    return returnImage;
}

- (UIImage*)convertImageToGreyScale {
    
    CGRect imageRect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil, self.size.width, self.size.height, 8, 0, colorSpace, kCGImageAlphaNone);
    CGContextDrawImage(context, imageRect, [self CGImage]);
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    CFRelease(imageRef);
    return newImage;
}

- (instancetype)imageWithOverlayColor:(UIColor *)overlayColor
{
    UIImage *image = self;
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToMask(context, rect, image.CGImage);
    CGContextSetFillColorWithColor(context, [overlayColor CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *flippedImage = [UIImage imageWithCGImage:img.CGImage
                                                scale:1.0 orientation: UIImageOrientationDownMirrored];
    
    return flippedImage;
}

- (UIImage *)waterImageWithLogo:(UIImage *)logoImage atRect:(CGRect)frame{
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0.0);
    //2.绘制底层图片
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    // 绘制log
    [logoImage drawInRect:frame];
    
    //4.从上下文去除获得的新图片对象
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    //5.结束上下次文
    UIGraphicsEndImageContext();
    //返回新创建的图片对象
    return newImage;
}
@end
