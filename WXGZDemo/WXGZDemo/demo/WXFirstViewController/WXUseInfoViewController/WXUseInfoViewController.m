//
//  WXUseInfoViewController.m
//
//  Created by 谭建中 on 9/5/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXUseInfoViewController.h"
#import "WXUseInfoView.h"
#import "UIView+SGXib.h"
@interface WXUseInfoViewController ()
@property (nonatomic, strong) NSMutableArray *useInfoViews;
@end

@implementation WXUseInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.useInfoViews = @[].mutableCopy;
    [self addSubViewNum:10];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
    
}

- (void)addSubViewNum:(NSInteger)num
{
    //每一行的个数
    NSInteger lineNum = 1;
    //计算宽度
    CGFloat scrW = [UIScreen mainScreen].bounds.size.width;
    CGFloat infoViewW = scrW;
    CGFloat infoViewH = 54;
    for (int i = 0; i < num; i ++) {
        WXUseInfoView *infoView = [WXUseInfoView loadUseInfoView];
        infoView.userInteractionEnabled = YES;
        NSInteger row = i / lineNum;
        CGFloat infoViewX = 0;
        CGFloat infoViewY =  infoViewH  * row  + 1;
        infoView.frame = CGRectMake(infoViewX, infoViewY, infoViewW, infoViewH);
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
        lineView.frame = CGRectMake(infoViewX,CGRectGetMaxY(infoView.frame) , scrW, 0.5);
        
        if (i == 0) {
            infoView.tf1.text = @"user_id";
            infoView.tf2.text = @"songxuhua_usewrid";
        }
        if (i == 1) {
            infoView.tf1.text = @"user_name";
            infoView.tf2.text = @"songxuhua";
        }
        
        if (i == 2) {
            infoView.tf1.text = @"user_phone";
            infoView.tf2.text = @"18681508819";
        }
        
        self.tabViewContentH = CGRectGetMaxY(lineView.frame) + 0.5;
        [self.useInfoViews addObject:infoView];
        
        
        [self.tableView addSubview:infoView];
        [self.tableView addSubview:lineView];
        
    }
    
}

- (void)addRightItem
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"保存信息" style:UIBarButtonItemStylePlain target:self action:@selector(clickItem)];
     rightItem.tintColor = [UIColor colorWithRed:69/255.0 green:73/255.0 blue:76/255.0 alpha:1];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16],NSFontAttributeName, nil] forState:UIControlStateNormal];
    
}
- (void)clickItem
{
    NSMutableDictionary *muDic = @{}.mutableCopy;
    [self.useInfoViews enumerateObjectsUsingBlock:^(WXUseInfoView  * infoView, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary * paraDic =  [infoView getParaDic];
        if (paraDic) {
            [muDic addEntriesFromDictionary:paraDic];
        }
    }];
    [[NSNotificationCenter defaultCenter]  postNotificationName:@"WXUseInfoViewControllerUseInfoNoti" object:muDic userInfo:nil];
}
@end
