//
//  WXUseInfoView.m
//
//  Created by 谭建中 on 9/5/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXUseInfoView.h"
@implementation WXUseInfoView

+ (instancetype)loadUseInfoView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WXUseInfoView1" owner:nil options:nil] lastObject];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (@available(iOS 13.0, *)) {
        self.tf1.backgroundColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [UIColor systemGray2Color];
            }
            return [UIColor whiteColor];
        }];
        self.tf2.backgroundColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [UIColor systemGray2Color];
            }
            return [UIColor whiteColor];
        }];
    } else {
       self.tf1.backgroundColor = [UIColor whiteColor];
        self.tf1.backgroundColor = [UIColor whiteColor];

        // Fallback on earlier versions
    }
}

- (NSDictionary *)getParaDic
{
    if (self.tf1.text.length && self.tf2.text.length) {
        return @{self.tf1.text:self.tf2.text};
    }else{
        return nil;
    }
}
@end
