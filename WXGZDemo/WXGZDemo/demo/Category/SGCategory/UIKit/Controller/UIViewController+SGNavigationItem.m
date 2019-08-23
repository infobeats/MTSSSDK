//
//  UIViewController+SGNavigationItem.m
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import "UIViewController+SGNavigationItem.h"

@implementation UIViewController (SGNavigationItem)
- (void)setSg_rightBarItem:(UIBarButtonItem *)sg_rightBarItem {
    self.navigationItem.rightBarButtonItem = sg_rightBarItem;
}
- (void)setSg_rightBarItems:(NSArray<UIBarButtonItem *> *)sg_rightBarItems {
    self.navigationItem.rightBarButtonItems = sg_rightBarItems;
}
- (void)setSg_leftBarItem:(UIBarButtonItem *)sg_leftBarItem {
    self.navigationItem.leftBarButtonItem = sg_leftBarItem;
}
- (void)setSg_leftBarItems:(NSArray<UIBarButtonItem *> *)sg_leftBarItems {
    self.navigationItem.leftBarButtonItems = sg_leftBarItems;
}
- (UIBarButtonItem *)sg_rightBarItem {
    return self.navigationItem.rightBarButtonItem;
}
- (UIBarButtonItem *)sg_leftBarItem {
    return self.navigationItem.leftBarButtonItem;
}
- (NSArray<UIBarButtonItem *> *)sg_rightBarItems {
    return self.navigationItem.rightBarButtonItems;
}
- (NSArray<UIBarButtonItem *> *)sg_leftBarItems {
    return self.navigationItem.leftBarButtonItems;
}
@end


@implementation UIBarButtonItem (SGCreate)
+ (instancetype)sg_itmeWithTile:(NSString *)title target:(id)target action:(SEL)action buttonConfig:(SGItmeButtonConfig)config {
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    !config ?: config(btn);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
+ (instancetype)sg_itmeWithImage:(UIImage *)image target:(id)target action:(SEL)action buttonConfig:(SGItmeButtonConfig)config {
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    !config ?: config(btn);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
