//
//  UIView+SGXib.m
//  SGCategory
//
//  Created by Shangen Zhang on 15/12/25.
//  Copyright © 2015年 Shangen zhang. All rights reserved.
//

#import "UIView+SGXib.h"

@implementation UIView (SGXib)

+ (instancetype)viewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
