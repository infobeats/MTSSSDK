//
//  WXTextTableViewController.m
//  IDataVisibleBurialPointSDKTestDemo
//
//  Created by 谭建中 on 8/4/2019.
//  Copyright © 2019 devstore. All rights reserved.
//

#import "WXTextTableViewController.h"
#import "WXTextTableViewCell.h"

@interface WXTextTableViewController ()

@end

@implementation WXTextTableViewController

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
    return 99;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WXTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WXTextTableViewCell class])];
    if (cell == nil) {
        cell = [WXTextTableViewCell viewFromXib];
    }
 
    NSInteger row = indexPath.row + 1;
    NSString *title = [NSString stringWithFormat:@"%zd 赋予数据智慧 实现业务跃动",row];
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:title];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:3];

    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [title length])];

    [cell.testLabel setAttributedText:attributedString1];

    self.tabViewContentH = 99 * 69;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
