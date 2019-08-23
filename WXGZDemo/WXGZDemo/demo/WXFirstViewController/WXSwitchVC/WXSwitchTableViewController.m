//
//  WXSwitchTableViewController.m
//
//  Created by 谭建中 on 3/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXSwitchTableViewController.h"

@interface WXSwitchTableViewController ()

@end

@implementation WXSwitchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubViewNum:90];
}
- (void)addSubViewNum:(NSInteger)num
{
    //间距
    CGFloat margin = 28;
    //每一行的个数
    NSInteger lineNum = 4;
    //计算宽度
    CGFloat scrW = [UIScreen mainScreen].bounds.size.width;
    CGFloat w = (scrW - (lineNum + 1) * margin)/(lineNum *1.0);
    //高度
    CGFloat h = w;
    
    for (int i = 0; i < num; i ++) {
        UISwitch *swt = [[UISwitch alloc] init];
        
        swt.backgroundColor = [UIColor whiteColor];
     
        [swt addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        swt.layer.cornerRadius = 13;
        swt.layer.masksToBounds = YES;
        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:@"开关%d",i+1];
        label.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        // 图片所在行
        NSInteger row = i / lineNum;
        // 图片所在列
        NSInteger col = i % lineNum;
        // PointX
        CGFloat picX = margin + (w + margin) * col;
        // PointY
        CGFloat picY = margin + (h + margin) * row;
        // 图片的frame
        swt.frame = CGRectMake(picX, picY , w, h - 30);
        label.frame = CGRectMake(picX + w /2.0 - 25, picY + 10 + CGRectGetHeight(swt.frame), 60, 15);
        
        self.tabViewContentH = picY + h + margin;
        [self.view addSubview:swt];
        [self.view addSubview:label];
        
    }
    
}
- (void)clickBtn:(UIButton *)btn
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}
@end
