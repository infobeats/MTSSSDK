//
//  SGUIKitCategory.h
//  SGCategory
//
//  Created by Shangen Zhang on 2017/8/17.
//  Copyright © 2017 Shangen Zhang. All rights reserved.
//

#ifndef SGUIKitCategore_h
#define SGUIKitCategore_h

#import "NSString+SGSize.h"

#import "UIColor+SGHexColor.h"

#import "NSData+SGImageExtension.h"

#import "UIImage+SGExtension.h"

#import "CALayer+SGPauseAimate.h"

#import "UIView+SGCorners.h"
#import "UIView+SGFrame.h"
#import "UIView+SGXib.h"
#import "UIView+SGSnipImageView.h"
#import "UITableView+SGRegister.h"


#import "UIViewController+SGVisible.h"
#import "UIViewController+SGLoadFromStoryBoard.h"
#import "UIViewController+SGNavigationItem.h"
#import "UIViewController+SGKeyboardChangeNoti.h"



// 屏幕尺寸
#define iPhone6s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(750, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)

#define iPhone6SP ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

#define iPhone4S ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size)) : NO)



// 状态栏的高度
#define kStatusBarHight [[UIApplication sharedApplication] statusBarFrame].size.height

// 判断导航栏高度
#define kTableBarHeight (iPhoneX ? 83 : 49)
//返回导航栏的高度
#define kNavBarHeight (iPhoneX ? 88 : 64)
// 顶部安全区域高度
#define kSafeAreaTopHeight (iPhoneX ? 24:0)
// 底部安全区域高度
#define kSafeAreaBottomHeight (iPhoneX ? 34:0)

#endif /* SGUIKitCategore_h */
