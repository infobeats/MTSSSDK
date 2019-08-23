//
//  AppDelegate+MTSSSDK.m
//  WXGZDemo
//
//  Created by 谭建中 on 21/8/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "AppDelegate+MTSSSDK.h"
#import <MTSSSecSDK/MTSSSecSDK.h>

@implementation AppDelegate (MTSSSDK)
- (void)initMTSSSDKWithReportedURL:(NSString *)reportedURL appkey:(NSString *)appkey
{
    //1、初始化SDK环境（必需）
    [MTSSSec  startWithReportedURL:reportedURL
                            appKey:appkey];
    
    //2、配置是不是每次检测定位授权，如果app本身没有用到定位功能就不需要配置
    [MTSSSec setDetecteAndAuthorizedEveryLauchTime:YES
                                withAuthorizedType:MTSSAuthorizationTypeLocal];
    //3、日志打印开关
    [MTSSSec setLogEnable:NO];
    
    
#warning 步骤4、步骤5 如使用到用户信息和SDK管理平台数据同步功能需要用到以下代码
    //4.监听添加用户信息通知（采用通知的方式传递用户信息）
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addUserInfo:) name:@"WXUseInfoViewControllerUseInfoNoti" object:nil];
    
}

/**
 添加用户信息
 */
- (void)addUserInfo:(NSNotification *)noti
{
    if ([noti.object isKindOfClass:[NSDictionary class]]) {
        //5、上报用户自定义信息
        [MTSSSec addUserInfoWithDic:noti.object];
    }
}
@end
