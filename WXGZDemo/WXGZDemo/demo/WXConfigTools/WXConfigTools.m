//
//  WXConfigTools.m
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 2/8/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import "WXConfigTools.h"

#define userDef [NSUserDefaults standardUserDefaults]
#define mtssCurrentConfig2 @"mtssCurrentConfig2"

@implementation WXConfigTools
+ (void)setDefaultConfig2:(BOOL)defualtConfig
{
    [userDef setBool:defualtConfig forKey:mtssCurrentConfig2];
}
+ (BOOL)isDefaultConfig2
{
    return [userDef boolForKey:mtssCurrentConfig2];
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
             @"appkey":@"330ff568baf2f08e4336148c",
             @"url":@"http://42.51.172.61:16666",
             };
}

//保存appkey
+ (void)saveAppkey:(NSString *)appkey
{
    if (appkey.length) {
        [userDef setValue:appkey forKey:mtssAppkey];
    }
}
//获取保存的appkey
+ (NSString *)getAppkey
{
    return [userDef valueForKey:mtssAppkey];
}

//保存URL
+ (void)saveReportUrl:(NSString *)reportUrl
{
    if (reportUrl.length) {
        [userDef setValue:reportUrl forKey:mtssReportUrl];
    }
}
//获取保存的URL
+ (NSString *)getReportUrl
{
    return  [userDef valueForKey:mtssReportUrl];
}

+ (void)clearCache
{
    [userDef setValue:NULL forKey:mtssReportUrl];
    [userDef setValue:NULL forKey:mtssAppkey];
    [userDef synchronize];
}
@end
