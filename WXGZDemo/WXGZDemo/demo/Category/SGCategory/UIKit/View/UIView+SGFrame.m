//
//  UIView+SGFrame.m
//  SGCategory 
//
//  Created by Shangen Zhang on 16/12/13.
//  Copyright © 2016年 Shangen Zhang. All rights reserved.
//

#import "UIView+SGFrame.h"

@implementation UIView (SGFrame)
- (CGFloat)x {
    return self.frame.origin.x;
}
    
- (void)setX:(CGFloat)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
    
- (CGFloat)y {
    return self.frame.origin.y;
}
    
- (void)setY:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
    
- (CGFloat)width {
    return self.frame.size.width;
}
    
- (void)setWidth:(CGFloat)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}
    
- (CGFloat)height {
    return self.frame.size.height;
}
    
- (void)setHeight:(CGFloat)height{
    CGRect rect = self.frame;
    rect.size.height= height;
    self.frame = rect;
}
    
- (CGPoint)inCenter {
    return CGPointMake(self.width * 0.5, self.height * 0.5);
}
    
- (void)setInCenter:(CGPoint)Incenter {
}
    
- (CGSize)size  {
    return self.frame.size;
}
    
- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}
    
- (CGPoint)origin {
    return self.frame.origin;
}
    
- (void)setOrigin:(CGPoint)origin  {
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}
    
- (CGFloat)centerX{
    return self.center.x;
}
    
- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
    

- (CGFloat)centerY{
    return self.center.y;
}
    
- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
    
- (CGFloat)inCenterX{
    return self.inCenter.x;
}
    
- (void)setInCenterX:(CGFloat)inCenterX{
    CGPoint inCenter = self.inCenter;
    inCenter.x = inCenterX;
    self.inCenter = inCenter;
}
    
- (CGFloat)inCenterY{
    return self.inCenter.y;
}
    
- (void)setInCenterY:(CGFloat)inCenterY{
    CGPoint inCenter = self.inCenter;
    inCenter.y = inCenterY;
    self.inCenter = inCenter;
}

@end
