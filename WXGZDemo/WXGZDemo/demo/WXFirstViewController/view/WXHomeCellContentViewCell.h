//
//  WXHomeCellContentView.h
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 29/7/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WXItem;
@interface WXHomeCellContentViewCell : UITableViewCell

- (void)setItem:(NSArray <WXItem *> *)array clickBlock:(void(^)(WXItem *))block;

@end

NS_ASSUME_NONNULL_END
