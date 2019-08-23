//
//  SGFoundationLog.m
//  SGCategory
//
//  Created by Shangen Zhang on 2017/8/17.
//  Copyright © 2017 Shangen zhang. All rights reserved.
//


#import <Foundation/Foundation.h>

// 字典打印
@implementation NSDictionary (Log)
- (NSString *)description {
    return [self descriptionWithLocale:nil];
}
- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *string = [NSMutableString string];
    
    // 开头有个{
    [string appendString:@"{\n"];
    
    // 遍历所有的键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [string appendFormat:@"\t%@ : %@, \n", key,obj];
    }];
    
    // 结尾有个}
    [string appendString:@"}"];
    
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@", " options:NSBackwardsSearch];
    if (range.location != NSNotFound) [string deleteCharactersInRange:range];
    
    return string;
}
@end



// 数组打印
@implementation NSArray (Log)
- (NSString *)description {
    return [self descriptionWithLocale:nil];
}

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *string = [NSMutableString string];
    
    // 开头有个[
    [string appendString:@"[\n"];
    
    // 遍历所有的元素
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [string appendFormat:@"\t%@, \n", obj];
    }];
    
    // 结尾有个]
    [string appendString:@"]"];
    
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@", " options:NSBackwardsSearch];
    if (range.location != NSNotFound) [string deleteCharactersInRange:range];
    
    return string;
}

@end


// 集合打印
@implementation NSSet (Log)
- (NSString *)description {
    return [self descriptionWithLocale:nil];
}

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *string = [NSMutableString string];
    
    // 开头有个[
    [string appendString:@"[{\n"];
    
    // 遍历所有的元素
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        [string appendFormat:@"\t%@, \n", obj];
    }];
    
    // 结尾有个]
    [string appendString:@"}]"];
    
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@", " options:NSBackwardsSearch];
    
    if (range.location != NSNotFound) [string deleteCharactersInRange:range];
    
    return string;
}
@end
