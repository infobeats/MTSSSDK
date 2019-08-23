//
//  WXUseInfoView.h
//
//  Created by 谭建中 on 9/5/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXUseInfoView : UIView
@property (weak, nonatomic) IBOutlet UITextField *tf1;
@property (weak, nonatomic) IBOutlet UITextField *tf2;

+ (instancetype)loadUseInfoView;
- (NSDictionary *)getParaDic;
@end

NS_ASSUME_NONNULL_END
