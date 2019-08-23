//
//  UIView+Corners.m
//  SGCategory
//
//  Created by Shangen zhang on 16/10/31.
//  Copyright © 2016年 Shangen Zhang. All rights reserved.
//

#import "UIView+SGCorners.h"

@implementation UIView (SGCorners)
- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius  = cornerRadius;
}


- (void)setCorners:(UIRectCorner)rectCorner  cornerRadii:(CGFloat)cornerRadii {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(cornerRadii, cornerRadii)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    [self.layer setMasksToBounds:YES];
}

@end
