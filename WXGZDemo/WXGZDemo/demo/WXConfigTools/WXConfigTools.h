//
//  WXConfigTools.h
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 2/8/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define mtssAppkey @"MTSS_AppKey"
#define mtssReportUrl @"MTSS_ReportUrl"

@interface WXConfigTools : NSObject

+ (NSString *)getVersion;

+ (NSDictionary *)getDefaultConfig;
+ (NSDictionary *)getDefault2Config;

+ (void)setDefaultConfig2:(BOOL)defualtConfig;
+ (BOOL)isDefaultConfig2;
//保存appkey
+ (void)saveAppkey:(NSString *)appkey;
//获取保存的appkey
+ (NSString *)getAppkey;

//获取保存的URL
+ (NSString *)getReportUrl;
//保存URL
+ (void)saveReportUrl:(NSString *)reportUrl;

+ (void)clearCache;
@end

NS_ASSUME_NONNULL_END
