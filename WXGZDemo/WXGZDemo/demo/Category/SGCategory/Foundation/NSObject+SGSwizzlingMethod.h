//
//  NSObject+SGSwizzlingMethod.h
//  SGCategory
//
//  Created by Shangen Zhang on 2018/1/3.
//  Copyright © 2018年 Shangen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SGSwizzlingMethod)

/**
 *  方法 黑魔法交换
 */
+ (BOOL)sg_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel;


/**
 *  类方法 黑魔法交换
 */
+ (BOOL)sg_swizzleClassMethod:(SEL)origSel withMethod:(SEL)altSel;

@end
