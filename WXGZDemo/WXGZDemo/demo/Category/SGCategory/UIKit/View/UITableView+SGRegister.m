//
//  UITableViewController+SGRegister.m
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import "UITableView+SGRegister.h"

@implementation UITableView (SGRegister)
- (NSString *)sg_registerNibWithCellClass:(Class)cellClass {
    NSString *name = NSStringFromClass(cellClass);
    UINib *nib = [UINib nibWithNibName:name bundle:[NSBundle bundleForClass:cellClass]];
    [self registerNib:nib forCellReuseIdentifier:name];
    return name;
}
- (NSString *)sg_registerCellClass:(Class)cellClass {
    NSString *reuseId = NSStringFromClass(cellClass);
    [self registerClass:cellClass forCellReuseIdentifier:reuseId];
    return reuseId;
}

- (UITableViewCell *)sg_getReusedCellWithClass:(Class)cellClass {
    NSString *reuseId = NSStringFromClass(cellClass);
    
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell)  return cell;
    
    if ([NSClassFromString(reuseId) isKindOfClass:UITableViewCell.class]) {
        return [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
#ifdef DEBUG
    NSAssert(0, @"-[UITableView sg_reusedCellWithClass:] pragam class error\ntable view class:%@ did not register for table view",NSStringFromClass(cellClass));
#endif
    return [[UITableViewCell alloc] init];
}
@end
