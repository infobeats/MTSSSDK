//
//  NSArray+SGArrayFormSet.m
//  SGCategory
//
//  Created by shangen on 17/3/13.
//  Copyright © 2017 Shangen zhang. All rights reserved.
//

#import "NSArray+SGArrayFormSet.h"

@implementation NSArray (SGArrayFormSet)
+ (nonnull instancetype)sg_arrayWithSet:( NSSet * _Nonnull )set {
    if (!set || set.count == 0) {
        return [NSArray array];
    }
    NSMutableArray *arrayM = [NSMutableArray array];
    [set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        [arrayM addObject:obj];
    }];
    return arrayM;
}
@end
