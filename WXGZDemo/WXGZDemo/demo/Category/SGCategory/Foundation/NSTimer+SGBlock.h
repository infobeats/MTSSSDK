//
//  NSTimer+SGBlock.h
//  SGCategory
//
//  Created by Shangen Zhang on 16/9/10.
//  Copyright © 2016年 zsg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SGCallBackBlock)(void);

@interface NSTimer (SGBlock)
/**
 构造一个定时器 并开启

 @param runloop 定时器 加入的运行循环 （会在NSRunLoopCommonModes模式下执行）
 @param timeInterval 定时时间
 @param repeat 是否重复
 @param callBack 定时执行的block代码
 @return 定时器
 */
+ (instancetype)scheduledTimerWithRunloop:(NSRunLoop *)runloop
                             TimeInterval:(NSTimeInterval)timeInterval
                                  repeats:(BOOL)repeat
                                 callBack:(SGCallBackBlock)callBack;


/**
 构造一个定时器 并开启 （定时器会加入当前运行循环 NSRunLoopCommonModes模式下）
 
 @param timeInterval 定时时间
 @param repeat 是否重复
 @param callBack 定时执行的block代码
 @return 定时器
 */
+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                        repeats:(BOOL)repeat
                                       callBack:(SGCallBackBlock)callBack;

/**
 构造一个定时器 （需要自己加入运行循环开启定时器）

 @param timeInterval 定时时间
 @param repeat 是否重复执行
 @param callBack 定时执行的block代码
 @return 定时器
 */
+ (instancetype)timerWithTimeInterval:(NSTimeInterval)timeInterval
                               repeats:(BOOL)repeat
                              callBack:(SGCallBackBlock)callBack;
@end
