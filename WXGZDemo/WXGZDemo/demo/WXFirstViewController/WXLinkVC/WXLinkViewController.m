//
//  WXBtnViewController.m
//
//  Created by 谭建中 on 2/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXLinkViewController.h"
#import "WXScreenSizeManager.h"
#import "WXTestViewController.h"
#include <objc/runtime.h>
#import "UIImage+WXimage.h"
#import "WXTextTableViewCell.h"

static NSInteger num = 99;

@interface WXLinkViewController ()
@end

@implementation WXLinkViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WXTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WXTextTableViewCell class])];
    if (cell == nil) {
        cell = [WXTextTableViewCell viewFromXib];
    }
    cell.imageView2.image = [UIImage imageNamed:@"图标／24px／链接"];
    //    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    //    cell.selectedBackgroundView = [[UIView alloc] init];
    NSInteger row = indexPath.row + 1;
    NSString *title = [NSString stringWithFormat:@"%zd 原生跳转链接文字",indexPath.row];
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:title];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:3];
    
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [title length])];
    
    [cell.testLabel setAttributedText:attributedString1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.tabViewContentH = num * 56;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    NSString *classStr = [NSString stringWithFormat:@"WXTestViewController%zd",indexPath.row];
    const char * class = [classStr UTF8String];
    UIViewController *vc;
    //判断是否有一个Class
    if (NSClassFromString(classStr)) {
        NSLog(@"%@",NSClassFromString(classStr));
        vc = [[NSClassFromString(classStr) alloc] init];
    }else
    {
        Class newClass = objc_allocateClassPair([WXTestViewController class], class, 0);
        objc_registerClassPair(newClass);
        vc = [[newClass alloc] init];
    }
    
    [vc setValue:[NSString stringWithFormat:@"原生页面%zd",indexPath.row] forKey:@"title"];
    [vc setValue:[NSString stringWithFormat:@"原生页面%zd",indexPath.row] forKey:@"originTitle"];
    [self.navigationController pushViewController:vc animated:YES];

}

@end
