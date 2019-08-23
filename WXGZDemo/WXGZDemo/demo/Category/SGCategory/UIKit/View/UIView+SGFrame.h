//
//  UIView+SGFrame.h
//  SGCategory
//
//  Created by Shangen Zhang on 16/12/13.
//  Copyright © 2016年 Shangen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SGFrame)

    /** frame得X值 */
@property CGFloat x;
    
/** frame的Y值 */
@property CGFloat y;
    
/** 自身中尺寸宽度 */
@property CGFloat width;
    
/** 自身尺寸高度 */
@property CGFloat height;
    
/** 自身bounds中心点位置 */
@property CGPoint inCenter;
    
/** 自身frame得ori */
@property CGPoint origin;
    
/** 自身尺寸 */
@property CGSize size;
    
/** frame 的中心点位置X值 */
@property CGFloat centerX;
    
/** frame 的中心点位置Y值 */
@property CGFloat centerY;
    
/** 自身bounds中心点X值 */
@property CGFloat inCenterX;
    
/** 自身bounds中心点Y值 */
@property CGFloat inCenterY;

@end
