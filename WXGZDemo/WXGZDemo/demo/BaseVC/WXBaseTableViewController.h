//
//  WXBaseTableViewController.h
//
//  Created by 谭建中 on 3/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXBaseTableViewController : UITableViewController
//记录加载视图以后的总高度
@property (nonatomic, assign) CGFloat tabViewContentH;
@end

NS_ASSUME_NONNULL_END
