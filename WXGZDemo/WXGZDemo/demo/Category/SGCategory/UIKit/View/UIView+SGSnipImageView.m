//
//  UIView+SGSnipImageView.m
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import "UIView+SGSnipImageView.h"

@implementation UIView (SGSnipImageView)
- (UIImageView *)createSnipshotImageView {
    // 生成一张图片
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // 生成imageView
    UIImageView *snapshot = [[UIImageView alloc] initWithImage:image];
    snapshot.center = self.center;
    snapshot.alpha = 0.6;
    snapshot.layer.masksToBounds = YES;
    snapshot.layer.cornerRadius = 0.0;
    return snapshot;
}
@end
