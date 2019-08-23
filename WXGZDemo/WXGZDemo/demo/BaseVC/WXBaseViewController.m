//
//  WXBaseViewController.m
//
//  Created by 谭建中 on 1/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXBaseViewController.h"
#import "UIColor+DCColorChange.h"
#import "UIImage+SGColorImage.h"

#import "UIImage+WXimage.h"
@interface WXBaseViewController ()

@end

@implementation WXBaseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    //通过barTintColor来设置背景色
//    UIColor *color = [UIColor whiteColor];
//    //设置背景图
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:color]
//                                                  forBarMetrics:UIBarMetricsDefault];
//    
//
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self addRightItem];
    [self addLeftItem];

}

- (void)addLeftItem
{
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    UIImage *image = [UIImage imageNamed:@"图标／44px／箭头黑色"];
    btn.backgroundColor = [UIColor clearColor];
    [btn setImage:image forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0 ,-45,0,0);
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:btn];
    back.tintColor = [UIColor whiteColor];
    

    self.navigationItem.leftBarButtonItem = back;
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)addRightItem
{
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"崩溃测试" style:UIBarButtonItemStylePlain target:self action:@selector(clickItem)];
//    rightItem.tintColor = [UIColor whiteColor];
//    self.navigationItem.rightBarButtonItem = rightItem;
//    
//    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:16],NSFontAttributeName, nil] forState:UIControlStateNormal];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //恢复到默认的设置
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
}
@end
