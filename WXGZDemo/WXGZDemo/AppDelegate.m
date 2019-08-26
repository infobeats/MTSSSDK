//
//  AppDelegate.m
//  WXGZDemo
//
//  Created by Rachel on 2017/12/28.
//  Copyright © 2017年 ijiami. All rights reserved.
//

#import "AppDelegate.h"
#import "WXUITabbarVC.h"
#import "WXConfigTools.h"
#import "AppDelegate+MTSSSDK.h"



@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    NSString * reportedURL = @"http://172.10.4.94:8889";
    NSString * appkey = @"330ff568baf2f08ebb110f53";
#warning 步骤0 这段代码demo需求，使用中不需要集成进去！！!
    //0、读取切换环境缓存的配置信息（这段代码不需要集成进去！！！）
    if ([WXConfigTools getAppkey])      appkey =  [WXConfigTools getAppkey];
    if ([WXConfigTools getReportUrl])   reportedURL = [WXConfigTools getReportUrl];
    
    
    //1、初始化SDK
    [self initMTSSSDKWithReportedURL:reportedURL appkey:appkey];
 
 
    WXUITabbarVC *tabBarVC = [[WXUITabbarVC alloc] init];
    self.window.rootViewController = tabBarVC;
    return YES;
    
}

@end


