//
//  CATextLayer+SGUIKitProperty.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


@interface CATextLayer (SGUIKitProperty)
/**
 自动调整宽高
 */
- (void)sizeToFit;

@property UIFont *textFont;

@property UIColor * backgroundUIColor;

@property UIColor * textColor;

@end
