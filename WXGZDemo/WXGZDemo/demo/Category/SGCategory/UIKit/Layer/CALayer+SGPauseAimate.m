//
//  CALayer+SGPauseAimate.m
//  SGCategory
//
//  Created by Shangen Zhang on 15/8/14.
//  Copyright (c) 2015年 Shangen zhang . All rights reserved.
//

#import "CALayer+SGPauseAimate.h"

@implementation CALayer (SGPauseAimate)

- (void)sg_pauseAnimate
{
    CFTimeInterval pausedTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    self.speed = 0.0;
    self.timeOffset = pausedTime;
}

- (void)sg_resumeAnimate
{
    CFTimeInterval pausedTime = [self timeOffset];
    self.speed = 1.0;
    self.timeOffset = 0.0;
    self.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.beginTime = timeSincePause;
}

@end
