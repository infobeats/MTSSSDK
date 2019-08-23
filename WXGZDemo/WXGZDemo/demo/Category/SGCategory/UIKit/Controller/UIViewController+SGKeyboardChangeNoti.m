//
//  UIViewController+SGKeyboardChangeNoti.m
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import "UIViewController+SGKeyboardChangeNoti.h"

@implementation UIViewController (SGKeyboardChangeNoti)
#pragma mark - View Will Appear Section
- (void)sg_addKeyboardChangeNoti {
    //Add observers for keyboard showing or hiding notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sg_keyboardWillShowOrHide:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sg_keyboardWillShowOrHide:) name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark - View Will Disappear Section
- (void)sg_removeKeyboardChangeNoti {
    
    //Remove observers for keyboard showing or hiding notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark - Keyboard status

- (void)sg_keyboardWillShowOrHide:(NSNotification *)notification {
    
    // Orientation
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    // User Info
    NSDictionary *info = notification.userInfo;
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    int curve = [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
    CGRect keyboardEnd = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // Keyboard Size
    //Checks if IOS8, gets correct keyboard height
    CGFloat keyboardHeight = UIInterfaceOrientationIsLandscape(orientation) ? ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.000000) ? keyboardEnd.size.height : keyboardEnd.size.width : keyboardEnd.size.height;
    
    // Correct Curve
    UIViewAnimationOptions animationOptions = curve << 16;
    
    [self keyBoardHeightWillChange:notification.name duration:duration animationOptions:animationOptions keyboardHeight:keyboardHeight];
}
- (void)keyBoardHeightWillChange:(NSString *)notificationName
                        duration:(NSTimeInterval)duration
                animationOptions:(UIViewAnimationOptions)animationOptions
                  keyboardHeight:(CGFloat)keyboardHeight {
    // sub class implement...
}
@end
