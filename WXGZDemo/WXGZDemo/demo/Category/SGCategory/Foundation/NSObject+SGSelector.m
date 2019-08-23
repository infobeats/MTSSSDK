//
//  NSObject+SGSelector.m
//  SGCategory
//
//  Created by Shangen Zhang on 16/12/26.
//  Copyright © 2016年 Shangen zhang. All rights reserved.
//

#import "NSObject+SGSelector.h"

@implementation NSObject (SGSelector)

- (id)sg_performSelector:(SEL)selector withObject:(id)objc {
    if (!objc) {
        objc = [NSNull null];
    }
    return [self sg_performSelector:selector withObjects:@[objc]];
   
}


- (id)sg_performSelector:(SEL)selector withObjects:(NSArray *)objects {
    // 获取方法签名
    NSMethodSignature *sinnature = [[self class] instanceMethodSignatureForSelector:selector];
    // 方法签名校验 是否实现
    if (sinnature == nil) {
        NSLog(@"hjl-  未查找到对应的方法");
        return nil;
    }
    
    // 根据方法签名 创建消息调用对象
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sinnature];
    
    // 默认传的两个值 参数
    invocation.selector = selector;
    invocation.target = self;
    
    // 减去默认传递的两个参数
    NSInteger argumentCount = sinnature.numberOfArguments - 2;
    
    // 数组界限获取 最高不能超过方法的参数
    argumentCount = MIN(argumentCount, objects.count);
    
    // 设置参数
    for (NSInteger i = 0; i < argumentCount; i++) {
        id obj = objects[i];
        if ([obj isKindOfClass:[NSNull class]]) {
            continue;
        }
        [invocation setArgument:&obj atIndex:i + 2];
    }
    
    // 执行方法
    [invocation invoke];
    
    // 获取返回值
    id returnValue = nil;
    if (sinnature.methodReturnLength) {
        [invocation getReturnValue:&returnValue];
    }
    
    return returnValue;
}

#pragma mark - 类方法
+ (id)sg_performClassSelector:(SEL)selector {
    // 校验
    if ([self methodSignatureForSelector:selector]) {
        // 发消息
        return ((id (*)(id, SEL))[self methodForSelector:selector])(self, selector);
    }
 
    
#ifdef DEBUG // debug 模式下 抛出异常
    [NSException raise:@"错误方法" format:@"+[%@ %@] 类方法找不到",self.class,NSStringFromSelector(selector)];
#endif

    return nil;
}


+ (id)sg_performClassSelector:(SEL)selector withObject:(id)objc {
    
    // 校验
    if ([self methodSignatureForSelector:selector]) {
        // 发消息
        return ((id (*)(id, SEL,id))[self methodForSelector:selector])(self, selector,objc);
    }
#ifdef DEBUG    // debug 模式下 抛出异常
    [NSException raise:@"错误方法" format:@"+[%@ %@] 类方法找不到",self.class,NSStringFromSelector(selector)];
#endif
    return nil;
}

+ (id)sg_performClassSelector:(SEL)selector withObject1:(id)objc1 object2:(id)objc2 {
    
    // 校验
    if ([self methodSignatureForSelector:selector]) {
        // 发消息
        return ((id (*)(id, SEL,id,id))[self methodForSelector:selector])(self, selector,objc1,objc2);
    }
#ifdef DEBUG    // debug 模式下 抛出异常
    [NSException raise:@"错误方法" format:@"+[%@ %@] 类方法找不到",self.class,NSStringFromSelector(selector)];
#endif
    return nil;
}

- (id)sg_performInstanceSelector:(SEL)selector withObject:(id)objct {
    
    if ([self respondsToSelector:selector]) {
        // 发消息
        return ((id (*)(id, SEL,id))[self methodForSelector:selector])(self, selector,objct);
    }
    
#ifdef DEBUG    // debug 模式下 抛出异常
    [NSException raise:@"错误方法" format:@"-[%@ %@]%@ 对象方法找不到",self.class,NSStringFromSelector(selector),self];
#endif
    return nil;
}
- (id)sg_performInstanceSelector:(SEL)selector withObject1:(id)objc1 object2:(id)objc2 {
    
    if ([self respondsToSelector:selector]) {
        // 发消息
        return ((id (*)(id, SEL,id,id))[self methodForSelector:selector])(self, selector,objc1,objc2);
    }
    
#ifdef DEBUG    // debug 模式下 抛出异常
    [NSException raise:@"错误方法" format:@"-[%@ %@]%@ 对象方法找不到",self.class,NSStringFromSelector(selector),self];
#endif
    return nil;
}

@end
