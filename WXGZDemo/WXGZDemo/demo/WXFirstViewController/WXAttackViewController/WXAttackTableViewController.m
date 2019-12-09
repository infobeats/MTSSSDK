//
//  WXAttackTableViewController.m
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 31/7/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import "WXAttackTableViewController.h"
#import "UIImage+SGColorImage.h"

@interface WXAttackTableViewController ()
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation WXAttackTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 13.0, *)) {
        UIColor *backcolor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                 return [UIColor systemBackgroundColor];
             }
             return [UIColor colorWithRed:238/255.0 green:241/255.0 blue:244/255.0 alpha:1];
        }];
        self.view.backgroundColor = backcolor;
        
    } else {
        self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:241/255.0 blue:244/255.0 alpha:1];
    }
    [self addSubViewNum:99];
    
}
- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[@"201-注入攻击分析",@"202-调试攻击",@"203-位置欺诈分析",@"204-网络代理分析",@"205-设备复用分析",@"206-框架攻击分析",@"208-系统签名破坏分析",@"209-LIBC内核破坏分析",@"210-系统加速分析",@"211-设备信息篡改分析", @"212-敏感配置分析",@"213-域名风险分析", @"214-风险进程分析",@"215-恶意应用检测",@"216-越狱检测",
            ];
    }
    return _dataSource;
}
- (void)addSubViewNum:(NSInteger)num
{
    //间距
    CGFloat Leftmargin = 16;
    CGFloat Rightmargin = 16;
    CGFloat middleMargin = 16;    //每一行的个数
    
    CGFloat Topmargin = 16;
    NSInteger lineNum = 2;
    //计算宽度
    CGFloat scrW = [UIScreen mainScreen].bounds.size.width;
    CGFloat w = (scrW - Leftmargin - Rightmargin - middleMargin)/(lineNum *1.0);
    //高度
    CGFloat segmentH = 48;
    
    for (int i = 0; i < self.dataSource.count; i ++) {
        UIButton *btn = [[UIButton alloc] init];
        NSString *titleTag = self.dataSource[i];
        NSString *title = [titleTag componentsSeparatedByString:@"-"].lastObject;
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        if (@available(iOS 13.0, *)) {
            UIColor *btnBack = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
                 if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                       return [UIColor systemGray2Color];
                   }
                   return [UIColor whiteColor];
                
            }];
            btn.backgroundColor = btnBack;
            [btn setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
        } else {
            // Fallback on earlier versions
            btn.backgroundColor = [UIColor whiteColor];
            [btn setTitleColor:[UIColor colorWithRed:32/255.0 green:40/255.0 blue:49/255.0 alpha:1] forState:UIControlStateNormal];
        }
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 3;
        btn.tag = [[titleTag componentsSeparatedByString:@"-"].firstObject integerValue];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];

        [btn setBackgroundImage:[UIImage imageWithColor:[UIColor grayColor]] forState:UIControlStateHighlighted];

        [btn setBackgroundImage:[UIImage imageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
        // 图片所在行
        NSInteger row = i / lineNum;
        // 图片所在列
        NSInteger col = i % lineNum;
        // PointX
        CGFloat picX = Leftmargin + (w + middleMargin) * col;
        // PointY
        CGFloat picY = Topmargin + (segmentH + Topmargin) * row;
        // 图片的frame
        btn.frame = CGRectMake(picX, picY , w, segmentH);
        self.tabViewContentH = picY + segmentH + Topmargin;
        [self.view addSubview:btn];
    }
    
}
- (void)clickBtn:(UIButton *)btn
{
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor grayColor]] forState:UIControlStateNormal];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    });

    [[NSNotificationCenter defaultCenter] postNotificationName:@"MTSSSecDetection" object:@(btn.tag)];
  
}
@end
