//
//  WXSegmentTableViewController.m
//
//  Created by 谭建中 on 3/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXSegmentTableViewController.h"
#import "UIImage+WXimage.h"
@interface WXSegmentTableViewController ()

@end

@implementation WXSegmentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubViewNum:99];
}
- (void)addSubViewNum:(NSInteger)num
{
    //间距
    CGFloat Leftmargin = 15;
    CGFloat Rightmargin = 15;
    CGFloat middleMargin = 15;    //每一行的个数

    CGFloat Topmargin = 20;
    NSInteger lineNum = 2;
    //计算宽度
    CGFloat scrW = [UIScreen mainScreen].bounds.size.width;
    CGFloat w = (scrW - Leftmargin - Rightmargin - middleMargin)/(lineNum *1.0);
    
    //高度
    CGFloat segmentH = 44;
    CGFloat labelH = 25;
    CGFloat marginToSegment = 5;
    CGFloat h = segmentH +  marginToSegment + labelH;
    
    for (int i = 0; i < num; i ++) {
        UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"item1",@"item2",@"item3"]];
        seg.selectedSegmentIndex = 1;
        
        seg.backgroundColor = [UIColor colorWithRed:238/255.0 green:241/255.0 blue:244/255.0 alpha:1];
        seg.tintColor = [UIColor colorWithRed:24/255.0 green:125/255.0 blue:228/255.0 alpha:1];
        //设置Segment的字体
        NSDictionary *dic = @{
                              //1.设置字体样式:例如黑体,和字体大小
                              NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldMT" size:13],
                              //2.字体颜色
                              NSForegroundColorAttributeName:[UIColor colorWithRed:32/255.0 green:40/255.0 blue:49/255.0 alpha:1]
                              };
        seg.layer.cornerRadius = 10;
        seg.layer.masksToBounds = YES;
        seg.layer.borderWidth = 2;
        seg.layer.borderColor = [UIColor whiteColor].CGColor;
        [seg setTitleTextAttributes:dic forState:UIControlStateNormal];
        [seg addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventValueChanged];
        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:@"标签%d",i+1];
        label.textColor = [UIColor colorWithRed:32/255.0 green:40/255.0 blue:49/255.0 alpha:1];
        label.font = [UIFont systemFontOfSize:14];
        // 图片所在行
        NSInteger row = i / lineNum;
        // 图片所在列
        NSInteger col = i % lineNum;
        // PointX
        CGFloat picX = Leftmargin + (w + middleMargin) * col;
        // PointY
        CGFloat picY = Topmargin + (h + Topmargin) * row;
        // 图片的frame
        seg.frame = CGRectMake(picX, picY , w, segmentH);
        label.frame = CGRectMake(picX + w /2.0 - 25, picY + 10 + CGRectGetHeight(seg.frame), 60, labelH);
        
        self.tabViewContentH = picY + h + Topmargin;
        [self.view addSubview:seg];
        [self.view addSubview:label];
        
    }
    
}
- (void)clickBtn:(UIButton *)btn
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}
@end
