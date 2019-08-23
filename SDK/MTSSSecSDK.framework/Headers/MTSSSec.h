//
//  MTSSSec.h
//  MTSSSecSDK
//
//  Created by 谭建中 on 3/6/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//授权类型
typedef NS_ENUM(NSInteger, MTSSAuthorizationType)
{
    MTSSAuthorizationTypeLocal = 1,         // 用户定位授权
    MTSSAllAuthorizationNone = 0,     // 关闭
};


@interface MTSSSec : NSObject

/**
 服务器提供数据上报API访问的地址
 */
@property (nonatomic, readonly) NSString *reportedURL;

/**
 上传应用后生成的appKey
 */
@property (nonatomic, readonly) NSString *appKey;


/**
 单例
 */
+ (instancetype)sharedInstance;

/**
 *  设置采集上报的URL、appkey、
 *  @param reportedURL      服务器提供威胁感知数据上报访问的地址
 格式：协议://IP或域名:端口
 *  @param appKey           上传应用后生成的appKey
 */
+ (void)startWithReportedURL:(NSString *)reportedURL appKey:(NSString *) appKey;



/**
 *  检测授权
 *
 *  @param enable  是否每次启动检测并弹出授权框
 *  @param type    授权类型
 */
+ (void)setDetecteAndAuthorizedEveryLauchTime:(BOOL)enable withAuthorizedType:(MTSSAuthorizationType)type;


/**
 是否开启日志打印
 */
+ (void)setLogEnable:(BOOL)logEnable;




/**
 功能：上传用户信息和SDK获取的信息关联 ps：中文key值不支持
 @param userInfo 用户信息字典
 */
+ (void)addUserInfoWithDic:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
