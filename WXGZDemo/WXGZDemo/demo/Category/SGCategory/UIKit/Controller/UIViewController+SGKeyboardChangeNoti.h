//
//  UIViewController+SGKeyboardChangeNoti.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SGKeyboardChangeNoti)

/**
 * 添加键盘切换通知
 * add at View Will Appear
 */
- (void)sg_addKeyboardChangeNoti;


/**
 * 移除键盘切换通知
 * remove at View Will Disappear
 */
- (void)sg_removeKeyboardChangeNoti;


/**
 键盘即将切换高度通知方法 子类实现

 @param notificationName keyBoard show or hidden, ‘UIKeyboardWillShowNotification’ and 'UIKeyboardWillHideNotification'
 @param duration 动画化时长
 @param animationOptions UIViewAnimationOptions 动画效果 子类可执行相同的动画用于与键盘切换平滑同步
 @param keyboardHeight 键盘目标 高度
 */
- (void)keyBoardHeightWillChange:(NSString *)notificationName
                        duration:(NSTimeInterval)duration
                animationOptions:(UIViewAnimationOptions)animationOptions
                  keyboardHeight:(CGFloat)keyboardHeight;
@end
