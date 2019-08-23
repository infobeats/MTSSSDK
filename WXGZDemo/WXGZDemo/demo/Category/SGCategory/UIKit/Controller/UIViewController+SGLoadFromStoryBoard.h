//
//  UIViewController+SGLoadFromStoryBoard.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SGLoadFromStoryBoard)

/**
 从 StoryBoard 加载控制器
 
 --  StoryBoard 名称一定要    与ViewController class name 相同
 --  通过 Identifier加载控制器 所以 Identifier 与 class name 相同
 */
+ (instancetype)loadFromStoryBoard;
@end
