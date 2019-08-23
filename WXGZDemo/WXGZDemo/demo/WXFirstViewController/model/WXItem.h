//
//  WXItem.h
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 29/7/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXItem : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *vcClass;
- (instancetype)initImageName:(NSString *)name title:(NSString *)title vcClass:(NSString *)classStr;
+ (NSArray *)getSection1;
+ (NSArray *)getSection2;
@end

NS_ASSUME_NONNULL_END
