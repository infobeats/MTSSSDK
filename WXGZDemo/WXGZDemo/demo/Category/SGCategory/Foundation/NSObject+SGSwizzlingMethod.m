//
//  NSObject+SGSwizzlingMethod.m
//  SGCategory
//
//  Created by Shangen Zhang on 2018/1/3.
//  Copyright © 2018年 Shangen Zhang. All rights reserved.
//

#import "NSObject+SGSwizzlingMethod.h"
#import <objc/runtime.h>


@implementation NSObject (SGSwizzlingMethod)

+ (BOOL)sg_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel {
    // 根据selector 获取 method
    Method origMethod = class_getInstanceMethod(self, origSel);
    Method altMethod = class_getInstanceMethod(self, altSel);
   
    // 校验 method
    if (!origMethod || !altMethod) {
        return NO;
    }
    
    
    class_addMethod(self,
                    origSel,
                    class_getMethodImplementation(self, origSel),
                    method_getTypeEncoding(origMethod));
    class_addMethod(self,
                    altSel,
                    class_getMethodImplementation(self, altSel),
                    method_getTypeEncoding(altMethod));
    
    // 魔法交换
    method_exchangeImplementations(class_getInstanceMethod(self, origSel),
                                   class_getInstanceMethod(self, altSel));
    return YES;
}

+ (BOOL)sg_swizzleClassMethod:(SEL)origSel withMethod:(SEL)altSel {
    return [object_getClass((id)self) sg_swizzleMethod:origSel withMethod:altSel];
}
@end
