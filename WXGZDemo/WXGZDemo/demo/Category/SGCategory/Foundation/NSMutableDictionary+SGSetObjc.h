//
//  NSMutableDictionary+SGSetObjc.h
//  SGCategory
//
//  Created by Shangen Zhang on 16/12/23.
//  Copyright © 2016年 Shangen zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (SGSetObjc)
/**
 *  筛选出 空字符串、空数组、空字典 
 *
 */
- (void)sg_setObject:(id)object forKey:(NSString *)key;
@end
