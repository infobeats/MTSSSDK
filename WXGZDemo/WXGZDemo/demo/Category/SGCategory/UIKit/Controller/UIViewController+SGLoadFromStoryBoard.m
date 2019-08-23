//
//  UIViewController+SGLoadFromStoryBoard.m
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import "UIViewController+SGLoadFromStoryBoard.h"

@implementation UIViewController (SGLoadFromStoryBoard)
+ (instancetype)loadFromStoryBoard {
    //Class class = self.class;
    NSString *className = NSStringFromClass(self);
    UIStoryboard *sb = [UIStoryboard storyboardWithName:className bundle:[NSBundle bundleForClass:self]];
    
    return [sb instantiateViewControllerWithIdentifier:className];
}
@end
