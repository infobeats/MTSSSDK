//
//  UIView+SGXib.h
//  SGCategory
//
//  Created by Shangen Zhang on 15/12/25.
//  Copyright © 2015年 Shangen zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SGXib)

/**
 *  创建Xib 视图
 *  *** ps: XIB 的 标识必须是自己的类名 ***
 */
+ (instancetype)viewFromXib;

@end
