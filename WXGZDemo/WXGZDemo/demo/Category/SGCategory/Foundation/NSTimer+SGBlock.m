//
//  NSTimer+SGBlock.m
//  SGCategory
//
//  Created by Shangen Zhang on 16/9/10.
//  Copyright © 2016年 zsg. All rights reserved.
//

#import "NSTimer+SGBlock.h"

@implementation NSTimer (SGBlock)

+ (instancetype)scheduledTimerWithRunloop:(NSRunLoop *)runloop TimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeat callBack:(SGCallBackBlock)callBack{
    
    NSTimer *timer = [self timerWithTimeInterval:timeInterval repeats:repeat callBack:callBack];
    
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
    
    return timer;
}

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeat callBack:(SGCallBackBlock)callBack{
    
    return [self scheduledTimerWithRunloop:[NSRunLoop currentRunLoop] TimeInterval:timeInterval repeats:repeat callBack:callBack];
}

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeat callBack:(SGCallBackBlock)callBack {
    
    NSMethodSignature *methodSign = [self methodSignatureForSelector:@selector(callBack:)];
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSign];
    
    invocation.selector = @selector(callBack:);
    
    invocation.target = self;
    
    [invocation setArgument:&callBack atIndex:2];
    
    NSTimer *tiemr = [NSTimer timerWithTimeInterval:timeInterval invocation:invocation repeats:repeat];
    
    return tiemr;

}

+ (void)callBack:(SGCallBackBlock)callBack {
    !callBack ?: callBack();
}
@end
