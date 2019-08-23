//
//  NSString+SGRemoveSprit.m
//  SGCategory
//
//  Created by Shangen Zhang on 16/12/24.
//  Copyright © 2016年 Shangen zhang. All rights reserved.
//

#import "NSString+SGRemoveSprit.h"

@implementation NSString (SGRemoveSprit)

- (NSString *)sg_removeSpritSymbol {
    NSString *str = nil;
    // 去除 "\"
    str = [self stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    // 去除 "\n"
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
 
    return str;
}

@end
