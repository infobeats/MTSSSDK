//
//  UIViewController+SGNavigationItem.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SGItmeButtonConfig)(UIButton *button);


@interface UIViewController (SGNavigationItem)

@property UIBarButtonItem *sg_rightBarItem;
@property UIBarButtonItem *sg_leftBarItem;

@property NSArray <UIBarButtonItem *>* sg_rightBarItems;
@property NSArray <UIBarButtonItem *>* sg_leftBarItems;

@end





@interface UIBarButtonItem (SGCreate)

+ (instancetype)sg_itmeWithTile:(NSString *)title
                         target:(id)target
                         action:(SEL)action
                   buttonConfig:(SGItmeButtonConfig)config;

+ (instancetype)sg_itmeWithImage:(UIImage *)image
                          target:(id)target
                          action:(SEL)action
                    buttonConfig:(SGItmeButtonConfig)config;
@end
