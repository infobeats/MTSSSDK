//
//  NSString+SGSize.m
//  SGCategory
//
//  Created by Shangen Zhang on 16/12/13.
//  Copyright © 2016年 Shangen Zhang. All rights reserved.
//

#import "NSString+SGSize.h"

@implementation NSString (SGSize)
- (CGSize)sizeWith_Font:(UIFont *)font {
    return [self sizeWithAttributes:@{NSFontAttributeName:font}];
}
    
- (CGSize)sizeWith_Font:(UIFont *)font andMaxWith:(CGFloat)maxWidth {
    CGSize maxNameSize = CGSizeMake(maxWidth, MAXFLOAT);
    NSDictionary *textAttr = @{NSFontAttributeName : font};
    
    return [self boundingRectWithSize:maxNameSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttr context:nil].size;
}

- (CGFloat)textHeightWith_Font:(UIFont *)font andMaxWidth:(CGFloat)maxWidth {
    return [self sizeWith_Font:font andMaxWith:maxWidth].height;
}
@end
