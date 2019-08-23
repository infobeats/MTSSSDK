//
//  WXBtnViewController.m
//
//  Created by 谭建中 on 2/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXBtnViewController.h"
#import "WXScreenSizeManager.h"
#import "UIImage+WXimage.h"
@interface WXBtnViewController ()

@end

@implementation WXBtnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViewNum:99];

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
    CGFloat w = (scrW - Leftmargin - middleMargin * (lineNum - 1) - Rightmargin)/(lineNum *1.0);
    //高度
    CGFloat h = 44;
    
    for (int i = 0; i < num; i ++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.titleLabel.font = [UIFont systemFontOfSize:17];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:[NSString stringWithFormat:@"按钮%d",i + 1] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage wx_createImageWithColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        
        // 图片所在行
        NSInteger row = i / lineNum;
        // 图片所在列
        NSInteger col = i % lineNum;
        // PointX
        CGFloat picX =  Leftmargin + (w + middleMargin) * col;
        // PointY
        CGFloat picY = Topmargin + (h + Topmargin) * row;
        // 图片的frame
        btn.frame = CGRectMake(picX, picY , w, h);
        self.tabViewContentH = picY + h + Topmargin;
        [self.view addSubview:btn];
    }

}
- (void)clickBtn:(UIButton *)btn
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

@end
