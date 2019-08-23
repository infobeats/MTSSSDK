//
//  WXImageTableViewController.m
//
//  Created by 谭建中 on 3/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXImageTableViewController.h"

@interface WXImageTableViewController ()

@end

@implementation WXImageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViewNum:98];

}
- (void)addSubViewNum:(NSInteger)num
{
    //间距
    CGFloat Leftmargin = 15;
    CGFloat Rightmargin = 15;
    CGFloat Topmargin = 15;
    CGFloat middleMargin = 7;
    //每一行的个数
    NSInteger lineNum = 3;
    //计算宽度
    CGFloat scrW = [UIScreen mainScreen].bounds.size.width;
    CGFloat w = (scrW - Leftmargin - 2* middleMargin - Rightmargin )/(lineNum *1.0);
    //高度
    CGFloat h = w;
    
    for (int i = 0; i < num; i ++) {
        UIButton *btn = [[UIButton alloc] init];
        
        btn.backgroundColor = [UIColor whiteColor];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"pic%d",i + 1]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];

        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:@"图片%d",i+1];
        label.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];

        // 图片所在行
        NSInteger row = i / lineNum;
        // 图片所在列
        NSInteger col = i % lineNum;
        // PointX
        CGFloat picX = Leftmargin + (w + middleMargin) * col;
        // PointY
        CGFloat picY = Topmargin + (h + Topmargin) * row;
        // 图片的frame
        btn.frame = CGRectMake(picX, picY , w, h - 30);
//        btn.hidden = YES;
        label.frame = CGRectMake(picX + w /2.0 - 20, picY + 10 + CGRectGetHeight(btn.frame), 60, 15);
        
        self.tabViewContentH = picY + h + Topmargin;
        [self.view addSubview:btn];
        [self.view addSubview:label];

    }
    
}
- (void)clickBtn:(UIButton *)btn
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

@end
