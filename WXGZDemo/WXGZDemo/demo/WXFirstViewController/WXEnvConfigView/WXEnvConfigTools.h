//
//  WXEnvConfigTools.h
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 30/7/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXEnvConfigTools : UIView
+ (instancetype)sharedInstance;
- (void)show;
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
