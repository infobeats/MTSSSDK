//
//  WXTFTableViewController.m
//
//  Created by 谭建中 on 3/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXTFTableViewController.h"
#import "WXCustomTextField.h"
@interface WXTFTableViewController ()

@end

@implementation WXTFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.tableView.delegate = self;
    [self addSubViewNum:99];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];

}

- (void)addSubViewNum:(NSInteger)num
{
    //间距
    CGFloat margin = 15;
    CGFloat topMargin = 15;
    //每一行的个数
    NSInteger lineNum = 1;
    //计算宽度
    CGFloat scrW = [UIScreen mainScreen].bounds.size.width;

    CGFloat labelW = 70;
    CGFloat tfW = scrW - labelW - 3 *margin;
    //高度
    CGFloat labelH = 38;
    
    for (int i = 0; i < num; i ++) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:16];
        label.text = [NSString stringWithFormat:@"输入框%d",i + 1];
        label.textColor = [UIColor colorWithRed:32/255.0 green:40/255.0 blue:49/255.0 alpha:1];
        
        WXCustomTextField *tf = [[WXCustomTextField alloc] init];
        tf.layer.borderColor= [UIColor whiteColor].CGColor;
        tf.layer.borderWidth= 0.5f;
        tf.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
        tf.placeholder = @"请输入文字";
        [tf setValue:[UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
        [tf setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];

        [tf addTarget:self action:@selector(DidBegin:) forControlEvents:UIControlEventEditingDidBegin];

        
        NSInteger row = i / lineNum;
        NSInteger col = i % lineNum;
        CGFloat labX = margin + (labelW + margin) * col;
        CGFloat labY = topMargin + (labelH + topMargin * 2) * row;
        label.frame = CGRectMake(labX, labY, labelW, labelH);
        
        CGFloat tfX = labX + labelW + 6;
        CGFloat tfY = labY;
        tf.frame = CGRectMake(tfX, tfY , tfW, labelH);
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
        lineView.frame = CGRectMake(labX,CGRectGetMaxY(tf.frame) + topMargin , scrW - margin * 2, 0.5);
        
        self.tabViewContentH = CGRectGetMaxY(lineView.frame) + 0.5;
        [self.view addSubview:label];
        [self.view addSubview:tf];
        [self.view addSubview:lineView];
    }
    
}
- (void)DidBegin:(UITextField *)tf
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

@end
