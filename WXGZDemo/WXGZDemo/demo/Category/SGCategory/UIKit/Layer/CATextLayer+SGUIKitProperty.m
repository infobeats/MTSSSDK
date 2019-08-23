//
//  CATextLayer+SGUIKitProperty.m
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import "CATextLayer+SGUIKitProperty.h"

@implementation CATextLayer (SGUIKitProperty)


- (UIColor *)textColor {
    return [UIColor colorWithCGColor:self.foregroundColor];
}
- (void)setTextColor:(UIColor *)textColor {
    self.foregroundColor = textColor.CGColor;
}

- (void)setBackgroundUIColor:(UIColor *)backgroundColor {
    super.backgroundColor = backgroundColor.CGColor;
}
- (UIColor *)backgroundUIColor {
    return [UIColor colorWithCGColor:[super backgroundColor]];
}


- (void)setTextFont:(UIFont *)font {
    //choose a font
    self.contentsScale = [UIScreen mainScreen].scale;
    
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    self.font = fontRef;
    self.fontSize = font.pointSize;
    
    CGFontRelease(fontRef);
}

- (UIFont *)textFont {
    
    NSString *fontName = (NSString *)CFBridgingRelease(CGFontCopyPostScriptName((CGFontRef)self.font));
    return [UIFont fontWithName:fontName size:self.fontSize];
}

- (void)sizeToFit {
    UIFont *font = [self textFont] ?: [UIFont systemFontOfSize:17];
    CGRect frame = self.frame;
    frame.size = [(NSString *)self.string boundingRectWithSize:CGSizeMake(HUGE, HUGE) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    self.frame = frame;
}
@end
