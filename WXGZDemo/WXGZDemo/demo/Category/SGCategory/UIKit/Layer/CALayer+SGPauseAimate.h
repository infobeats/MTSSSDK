//
//  CALayer+SGPauseAimate.h
//  SGCategory
//
//  Created by Shangen Zhang on 15/8/14.
//  Copyright (c) 2015年 Shangen zhang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (SGPauseAimate)

// 暂停动画
- (void)sg_pauseAnimate;

// 恢复动画
- (void)sg_resumeAnimate;

@end
