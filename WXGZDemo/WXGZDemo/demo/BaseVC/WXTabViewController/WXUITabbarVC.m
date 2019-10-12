//
//  WXTabViewController.m
//
//  Created by 谭建中 on 1/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXUITabbarVC.h"
#import "WXUINavigationController.h"
#import "WXFirstViewController.h"
#import "WXSecondViewController.h"

@interface WXUITabbarVC ()

@end

@implementation WXUITabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addViewControllers];
    
    
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    //Normal
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateNormal];
    //Selected
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateSelected];
}
- (void)addViewControllers {
    
    WXFirstViewController *vc1 = [[WXFirstViewController alloc] init];
    WXUINavigationController *na1 = [[WXUINavigationController alloc] initWithRootViewController:vc1];
    vc1.tabBarItem.title = @"原生元素";
    NSString *icon1 = @"原生";
    NSString *icon10 = @"原生选中";
    [vc1.tabBarItem setImage:[UIImage imageNamed:icon1]];
    [vc1.tabBarItem setSelectedImage:[[UIImage imageNamed:icon10] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
 

    
    self.viewControllers = [NSArray arrayWithObjects:na1, nil];

    
}
//改变tabbar高度
- (void)viewWillLayoutSubviews{
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.size.height = 44;
    tabFrame.origin.y = self.view.frame.size.height - 44;
    self.tabBar.frame = tabFrame;
}


@end
