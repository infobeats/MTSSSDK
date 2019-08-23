//
//  AppDelegate+MTSSSDK.h
//  WXGZDemo
//
//  Created by 谭建中 on 21/8/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (MTSSSDK)

/**
 初始化SDK

 @param reportedURL 上报信息URL
 @param appkey 分配的appkey
 */
- (void)initMTSSSDKWithReportedURL:(NSString *)reportedURL appkey:(NSString *)appkey;
@end

NS_ASSUME_NONNULL_END

