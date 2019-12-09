//
//  WXConfigTools.m
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 2/8/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import "WXConfigTools.h"
#pragma GCC diagnostic ignored "-Wundeclared-selector"

#define userDef [NSUserDefaults standardUserDefaults]
#define mtssCurrentConfig2 @"mtssCurrentConfig2"

@implementation WXConfigTools
+ (void)setIsConfig1:(BOOL)Config1
{
    [[NSUserDefaults standardUserDefaults] setBool:Config1 forKey:mtssCurrentConfig2];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (BOOL)isConfig1
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:mtssCurrentConfig2];
}
+ (NSString *)getVersion
{
      id MTSSVersionManage = [NSClassFromString(@"MTSSVersionManage") performSelector:@selector(sharedInstance)];
    return [NSString stringWithFormat:@"%@",[MTSSVersionManage valueForKey:@"sdkVersion"]];
}
+ (NSDictionary *)getDefaultConfig
{
    
    return @{
             @"appkey":@"330ff568baf2f08eec81f009",
             @"url":@"http://172.10.4.104:8889",
             };
 
}
+ (NSDictionary *)getDefault2Config
{
    return @{
             @"appkey":@"330ff568baf2f08e015ae6fb",
             @"url":@"http://s1.infobeats.cn:16666",
             };
}

//保存appkey
+ (void)saveAppkey:(NSString *)appkey
{
    if (appkey.length) {
        [[NSUserDefaults standardUserDefaults] setValue:appkey forKey:MTSSAPPKEY];
         [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
//获取保存的appkey
+ (NSString *)getAppkey
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:MTSSAPPKEY];
}

//保存URL
+ (void)saveReportUrl:(NSString *)reportUrl
{
    if (reportUrl.length) {
        [[NSUserDefaults standardUserDefaults] setValue:reportUrl forKey:MTSSREPORTURL];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
//获取保存的URL
+ (NSString *)getReportUrl
{
    return  [[NSUserDefaults standardUserDefaults] valueForKey:MTSSREPORTURL];
}



@end
