//
//  UIViewController+Visible.m
//  SGUIKitCategory
//
//  Created by Shangen Zhang on 2018/3/5.
//

#import "UIViewController+SGVisible.h"

@implementation UIView (ViewController)
- (UIViewController *)viewController {
    id nextResponder = [self nextResponder];
    do {
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return nextResponder;
        }
        else if ([nextResponder isKindOfClass:[UIWindow class]]) {
            return nil;
        }
        nextResponder = [nextResponder nextResponder];
    } while (nextResponder);
    return nil;
}
@end


@implementation UIWindow (VisibleVc)

+ (UIWindow *)currentWindow {
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                return tmpWin;
            }
        }
    }
    return window;
}
+ (UIWindow *)appKeyWindow {
    return [UIApplication sharedApplication].keyWindow;
}

- (UIViewController *)seekCurrentVisibleVcWithvisibleType:(SGViewControllerVisibleType)visibleType {
    __block UIViewController *result = nil;
    NSEnumerationOptions options = (visibleType == SGViewControllerVisibleTypeTop) ? NSEnumerationReverse :  NSEnumerationConcurrent;
    [self.subviews enumerateObjectsWithOptions:options usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        result = obj.viewController;
        if (result) {
            *stop = YES;
        }
    }];
    return result ? : self.rootViewController;
}


@end


@implementation UIViewController (VisibleVc)
/**
 当前 window上面的展示的控制器
 */
+ (instancetype)currentVisibleTopVc {
    UIViewController *vc =  [self visibleVcForWindow:[UIWindow currentWindow] withVisibleType:SGViewControllerVisibleTypeTop] ;
    return [vc sg_topViewController] ;
   
}
- (UIViewController *)sg_topViewController {
    
    if  ([self isKindOfClass:[UITabBarController class]]){
        return [[(UITabBarController *)self selectedViewController] sg_topViewController];
    }else if ([self isKindOfClass:[UINavigationController class]]) {
        return  [(UINavigationController *)self visibleViewController] ? : self;
    }
    
    return self;
}

/**
 当前 window上面的展示的根控制器
 */
+ (instancetype)currentVisibleRootVc {
    return [self visibleVcForWindow:[UIWindow currentWindow] withVisibleType:SGViewControllerVisibleTypeTop];
}

+ (UIViewController *)visibleVcForWindow:(UIWindow *)window withVisibleType:(SGViewControllerVisibleType)visibleTyp {
    return [window seekCurrentVisibleVcWithvisibleType:visibleTyp];
}

+ (instancetype)rootVcForAppKeyWindow {
    return [UIWindow appKeyWindow].rootViewController;
}

@end
