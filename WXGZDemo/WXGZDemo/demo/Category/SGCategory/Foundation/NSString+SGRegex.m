//
//  NSString+SGRegex.m
//  SGCategory
//
//  Created by Shangen Zhang on 2017/5/10.
//  Copyright © 2017 Shangen zhang. All rights reserved.
//

#import "NSString+SGRegex.h"

@implementation NSString (SGRegex)
- (instancetype)sg_replaceRegexStr:(NSString *)regexStr withReplaceString:(NSString *)replaceStr {
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray * matches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    NSString *strTem = [self mutableCopy];
    
    for (NSTextCheckingResult *match in matches) {
        for (int i = 0; i < [match numberOfRanges]; i++) {
            strTem = [strTem stringByReplacingOccurrencesOfString:[self substringWithRange:[match rangeAtIndex:i]] withString:replaceStr];
        }
    }
    return strTem;
}

@end
