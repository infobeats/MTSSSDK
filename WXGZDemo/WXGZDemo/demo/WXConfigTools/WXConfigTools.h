//
//  WXConfigTools.h
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 2/8/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define MTSSAPPKEY @"MTSS_AppKey1"
#define MTSSREPORTURL @"MTSS_ReportUrl1"


@interface WXConfigTools : NSObject

/// 获取SDK版本
+ (NSString *)getVersion;

/// 获取配置1的配置
+ (NSDictionary *)getDefaultConfig;

/// 获取配置2的配置
+ (NSDictionary *)getDefault2Config;

/// 设置是否选择配置1
/// @param Config1 配置1
+ (void)setIsConfig1:(BOOL)Config1;

/// 是否是配置1
+ (BOOL)isConfig1;

//保存appkey
+ (void)saveAppkey:(NSString *)appkey;

//获取保存的appkey
+ (NSString *)getAppkey;

//获取保存的URL
+ (NSString *)getReportUrl;

//保存URL
+ (void)saveReportUrl:(NSString *)reportUrl;

@end

NS_ASSUME_NONNULL_END
