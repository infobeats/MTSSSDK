//
//  WXEnvConfigTools.m
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 30/7/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import "WXEnvConfigTools.h"
#import "WXEnvConfigView.h"
#import "WXMacro.h"
@interface WXEnvConfigTools ()
@property (nonatomic, strong) WXEnvConfigView *configView;

@end
@implementation WXEnvConfigTools
+ (instancetype)sharedInstance
{
    static WXEnvConfigTools *instance = nil;
//    static dispatch_once_t pred = 0;
//    dispatch_once(&pred, ^{
        instance = [[WXEnvConfigTools alloc] init];
        [instance setSubView];
//    });
    return instance;
}
- (void)setSubView
{
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    self.frame = kHLScreenFrame;
    self.configView = [[WXEnvConfigView alloc] init];
    self.configView.backgroundColor = [UIColor whiteColor];
    self.configView.layer.cornerRadius = 24;
    self.configView.layer.masksToBounds = YES;
    [self addSubview:self.configView];
 
}

- (void)show
{
    self.configView.frame = CGRectMake(0, 88, kHLScreenFrameWidth, kHLScreenFrameHeight);
    UIWindow *window = [self getApplicationWindow];
    [window addSubview:self];

    CATransition* transition = [CATransition animation];
    transition.duration =0.4f;
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromTop;
    [self.configView.layer addAnimation:transition forKey:kCATransition];
}

- (void)dismiss
{
    self.configView.frame = CGRectMake(kHLScreenFrameHeight, 88, kHLScreenFrameWidth, kHLScreenFrameHeight);
    
    CATransition* transition = [CATransition animation];
    transition.duration =0.4f;
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromBottom;
    [self.configView.layer addAnimation:transition forKey:kCATransition];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           [self removeFromSuperview];
    });
    
//    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

- (UIWindow *)getApplicationWindow
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (nil==window || window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    return window;
}

@end
