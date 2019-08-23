//
//  WXCustomTextField.m
//  IDataVisibleBurialPointSDKTestDemo
//
//  Created by 谭建中 on 9/4/2019.
//  Copyright © 2019 devstore. All rights reserved.
//

#import "WXCustomTextField.h"

@implementation WXCustomTextField



- (CGRect)editingRectForBounds:(CGRect)bounds{
    
    CGRect inset = CGRectMake(bounds.origin.x + 10, bounds.origin.y, bounds.size.width - 10, bounds.size.height);
    return inset;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 10, 0);  //或者这样写简单些
    
}
@end
