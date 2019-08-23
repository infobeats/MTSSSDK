//
//  NSMutableArray+SGAddObject.m
//  SGDemo
//
//  Created by Shangen Zhang on 2017/4/18.
//  Copyright © 2017 Shangen zhang. All rights reserved.
//

#import "NSMutableArray+SGAddObject.h"

@implementation NSMutableArray (SGAddObject)
+ (nonnull instancetype)sg_arrayWithCount:(NSUInteger)count {
    if (count < 1) {
        return [NSMutableArray arrayWithCapacity:0];
    }
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    NSInteger i = 0;
    NSNull *null = [NSNull null];
    while (++i <= count) {
        [arrayM addObject:null];
    }
    
    return arrayM;
}



- (void)sg_addObject:(_Nonnull id)object {
    
    if (!object) {
#ifdef DEBUG    // debug 模式下 抛出异常
        [NSException raise:@"错误赋值方法" format:@"%@ -[NSMutableArray addObject:] object is not nullable",self];
#else           // 发布环境  容错处理
     return;
#endif
       
    }
    [self addObject:object];
}

@end
