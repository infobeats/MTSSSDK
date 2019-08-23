//
//  NSArray+SGInvertedOrder.m
//  SGCategory
//
//  Created by Shangen Zhang on 2017/5/10.
//  Copyright © 2017 Shangen zhang. All rights reserved.
//

#import "NSArray+SGInvertedOrder.h"

@implementation NSArray (SGInvertedOrder)
- (instancetype)sg_invertedOrderArray {
    if (self.count) {
        NSMutableArray *temp = [NSMutableArray arrayWithCapacity:self.count];
        for (NSInteger i = self.count - 1; i >= 0; i--) {
            [temp addObject:self[i]];
        }
        return temp;
    }
    return self.mutableCopy;
}
@end
