//
//  NSMutableDictionary+SGSetObjc.m
//  SGCategory
//
//  Created by Shangen Zhang on 16/12/23.
//  Copyright © 2016年 Shangen zhang. All rights reserved.
//

#import "NSMutableDictionary+SGSetObjc.h"


@implementation NSMutableDictionary (SGSetObjc)

- (void)sg_setObject:(id)object forKey:(NSString *)key {
    
    if (object == nil || // 移除 空字符串 空的数组 空的字典
        (![self isKindOfClass:[NSMutableDictionary class]])||
        ([object isKindOfClass:[NSString class]] && [object isEqualToString:@""]) ||
        ([object isKindOfClass:[NSArray class]] && [(NSArray *)object count] < 1) ||
        ([object isKindOfClass:[NSDictionary class]] && [(NSDictionary *)object allKeys].count < 1)
        ){
        return;
    }
    
    return [self setObject:object forKey:key];
}

@end
