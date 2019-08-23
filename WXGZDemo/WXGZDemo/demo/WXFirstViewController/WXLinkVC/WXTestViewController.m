//
//  WXTestViewController.m
//
//  Created by 谭建中 on 4/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXTestViewController.h"
#import "Masonry.h"
#import "UIImage+WXimage.h"

@interface WXTestViewController ()
@property (nonatomic, strong) UIButton * btn;
@end

@implementation WXTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addTitle];
    
}

- (void)addTitle
{
    UIButton *btn = [[UIButton alloc] init];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc] initWithString:self.originTitle];
    NSRange titleRange = {0,[AttributedStr length]};
    [AttributedStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    [AttributedStr addAttribute:NSForegroundColorAttributeName
                          value:[UIColor colorWithRed:28/255.0 green:135/255.0 blue:235/255.0 alpha:1]
                          range:NSMakeRange(0, [AttributedStr length])];
    [AttributedStr addAttribute:NSFontAttributeName
                          value:[UIFont systemFontOfSize:18]
                          range:NSMakeRange(0 , [AttributedStr length])];
    [btn setAttributedTitle:AttributedStr forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.btn = btn;
    [btn setBackgroundImage:[UIImage wx_createImageWithColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
    [self.view addSubview:btn];
}
- (void)clickBtn:(UIButton *)btn
{
    NSLog(@"%@",btn);
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(40);
    }];
}
@end
