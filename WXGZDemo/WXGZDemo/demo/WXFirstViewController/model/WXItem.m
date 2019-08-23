//
//  WXItem.m
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 29/7/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import "WXItem.h"

@implementation WXItem
- (instancetype)initImageName:(NSString *)name title:(NSString *)title vcClass:(NSString *)classStr
{
    if (self = [self init]) {
        self.imageName = name;
        self.title = title;
        self.vcClass = classStr;
    }
    return self;
}
+ (NSArray *)getSection1
{
    WXItem *item1 = [[WXItem alloc] initImageName:@"图标／48px／按钮" title:@"按钮" vcClass:@"WXBtnViewController"];
    WXItem *item2 = [[WXItem alloc] initImageName:@"图标／48px／标签" title:@"输入框" vcClass:@"WXTFTableViewController"];
    WXItem *item3 = [[WXItem alloc] initImageName:@"图标／48px／文本" title:@"文本" vcClass:@"WXTextTableViewController"];
    WXItem *item4 = [[WXItem alloc] initImageName:@"图标／48px／图片" title:@"图片" vcClass:@"WXImageTableViewController"];
//    WXItem *item5 = [[WXItem alloc] initImageName:@"图标／48px／开关" title:@"开关" vcClass:@""];
    WXItem *item6 = [[WXItem alloc] initImageName:@"图标／48px／标签" title:@"标签" vcClass:@"WXSegmentTableViewController"];
    WXItem *item7 = [[WXItem alloc] initImageName:@"图标／48px／跳转" title:@"跳转" vcClass:@"WXLinkViewController"];
    
    return @[item1,item2,item3,item4 ,item6,item7];
}
+ (NSArray *)getSection2
{
    WXItem *item1 = [[WXItem alloc] initImageName:@"图标／48px／攻击界面" title:@"攻击界面" vcClass:@"WXAttackTableViewController"];
    WXItem *item2 = [[WXItem alloc] initImageName:@"图标／48px／修改地址" title:@"修改地址" vcClass:@"WXEnvConfigTools"];
    WXItem *item3 = [[WXItem alloc] initImageName:@"图标／48px／用户信息" title:@"用户信息" vcClass:@"WXUseInfoViewController"];
//    WXItem *item4 = [[WXItem alloc] initImageName:@"图标／48px／卡顿" title:@"卡顿" vcClass:@""];
    
    return @[item1,item2,item3];
}
@end
