//
//  NSData+SGImageExtension.m
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import "NSData+SGImageExtension.h"


@implementation NSData (SGImageExtension)
- (UIImageRealType)imageRealType{
    uint8_t c;
    [self getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return UIImageRealTypeJPEG;
        case 0x89:
            return UIImageRealTypePNG;
        case 0x47:
            return UIImageRealTypeGIF;
        case 0x49:
        case 0x4D:
            return UIImageRealTypeTIFF;
        case 0x52:
            // R as RIFF for WEBP
            if ([self length] < 12) {
                return UIImageRealTypeNone;
            }
            
            NSString *testString = [[NSString alloc] initWithData:[self subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return UIImageRealTypeImage_WEBP;
            }
            return UIImageRealTypeNone;
    }
    return UIImageRealTypeNone;
}
+ (NSData *)dataWithPNGImage:(UIImage *)image {
    return  UIImagePNGRepresentation(image);
}
+ (NSData *)dataWithJPEGImage:(UIImage *)image compressionQuality:(CGFloat)quality {
    return UIImageJPEGRepresentation(image, quality);
}
@end
