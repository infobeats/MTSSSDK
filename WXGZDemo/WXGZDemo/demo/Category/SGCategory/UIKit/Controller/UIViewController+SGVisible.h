//
//  UIViewController+Visible.h
//  SGUIKitCategory
//
//  Created by Shangen Zhang on 2018/3/5.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,SGViewControllerVisibleType) {
    SGViewControllerVisibleTypeTop,  // 显示在顶部的
    SGViewControllerVisibleTypeRoot, // 可见底部的控制器
    
};

@interface UIView (ViewController)
// 视图所在的控制器
@property (readonly) UIViewController * viewController;
@end


@interface UIWindow (VisibleVc)
/**
 当前window
 */
+ (UIWindow *)currentWindow;

/**
 当前 APP key window
 */
+ (UIWindow *)appKeyWindow;


/**
 获取window 当前显示的控制器

 @param visibleType 显示策略
 @return 当前显示的控制器
 */
- (UIViewController *)seekCurrentVisibleVcWithvisibleType:(SGViewControllerVisibleType)visibleType;
@end



@interface UIViewController (VisibleVc)

/**
 当前 window上面的展示的控制器
 */
+ (instancetype)currentVisibleTopVc;

/**
 当前 window上面的展示的根控制器
 */
+ (instancetype)currentVisibleRootVc;

/**
  获取window 当前上面的展示的控制器
 */
+ (instancetype)visibleVcForWindow:(UIWindow *)window
                         withVisibleType:(SGViewControllerVisibleType)visibleTyp;
/**
 当前 keywindow 的根控制器
 */
+ (instancetype)rootVcForAppKeyWindow;

@end
