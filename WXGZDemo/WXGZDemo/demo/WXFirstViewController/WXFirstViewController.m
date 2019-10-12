//
//  WXViewController1.m
//
//  Created by 谭建中 on 1/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXFirstViewController.h"
#import "WXTableViewCell.h"
#import "WXBtnViewController.h"
#import "WXTFTableViewController.h"
#import "WXImageTableViewController.h"
#import "WXSwitchTableViewController.h"
#import "WXSegmentTableViewController.h"
#import "WXLinkViewController.h"
#import "WXTextTableViewController.h"
#import "WXUseInfoViewController.h"
#import "WXHomeCellContentViewCell.h"
#import "WXItem.h"
#import "WXMacro.h"
#import "WXEnvConfigTools.h"


@interface WXFirstViewController ()<UITableViewDataSource,UITableViewDelegate,NSURLSessionDelegate>
@property (nonatomic, strong) UITableView *tabView;
 @property (nonatomic, strong) NSMutableArray *dataSource2;

@end

@implementation WXFirstViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.tabView];
     _dataSource2 =[WXItem getSection2].mutableCopy;
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = [UIColor systemBackgroundColor];
    } else {
         self.view.backgroundColor = WXBackColor;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self testBaidu];
        [self testHttpsbaidu];
    });
    
}
- (void)testBaidu
{
 
    NSURL *url = [NSURL URLWithString:@"https://www.qq.com"];
     NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    //4.根据会话对象创建一个Task(发送请求）
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:req];
    
    //5.执行任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [dataTask resume];
    });
}
- (void)testHttpsbaidu
{
    NSURL *url = [NSURL URLWithString:@"http://14.215.177.38"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    //4.根据会话对象创建一个Task(发送请求）
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:req];
    
    //5.执行任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [dataTask resume];
    });
}

- (void)addLeftItem
{
    
    
}
#pragma mark - NSURLSessionDelegate

- (UITableView *)tabView
{
    if (_tabView == nil) {
        
        _tabView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tabView.frame =  [UIScreen mainScreen].bounds;
        if (@available(iOS 13.0, *)) {
              _tabView.backgroundColor = [UIColor systemBackgroundColor];
          } else {
               _tabView.backgroundColor = WXBackColor;
          }
        _tabView.dataSource = self;
        _tabView.delegate = self;
        _tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tabView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    WXHomeCellContentViewCell *cell = [[WXHomeCellContentViewCell alloc] init];
        if (@available(iOS 13.0, *)) {
             cell.backgroundColor = [UIColor systemBackgroundColor];
         } else {
              cell.backgroundColor = WXBackColor;
         }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSMutableArray *data = _dataSource2;

    [cell setItem:data clickBlock:^(WXItem * obj) {
        if ([obj.vcClass isEqualToString:@"WXEnvConfigTools"]) {
            [[WXEnvConfigTools sharedInstance] show];
            return ;
        }
        if (obj.vcClass) {
            UIViewController *vc = [[NSClassFromString(obj.vcClass) alloc] init];
            vc.title = obj.title;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [self itemH] * 2 + 5 * 8;
    }
    return [self itemH] * 1 + 4 * 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 28;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(16,0,120,28);
    label.numberOfLines = 0;
    NSString *title ;
  
    title  = @"工具";
    UIColor *titleColor;
    if (@available(iOS 13.0, *)) {
        titleColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [UIColor labelColor];
            }
            return [UIColor colorWithRed:32/255.0 green:40/255.0 blue:49/255.0 alpha:1.0];
        }];
    } else {
        // Fallback on earlier versions
     titleColor = [UIColor colorWithRed:32/255.0 green:40/255.0 blue:49/255.0 alpha:1.0];
    }
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:title attributes: @{NSFontAttributeName: [UIFont systemFontOfSize:20],NSForegroundColorAttributeName:titleColor}];
    
    label.attributedText = string;
    label.textAlignment = NSTextAlignmentLeft;
    label.alpha = 1.0;
    label.backgroundColor = [UIColor clearColor];
    CGRect frame = [UIScreen mainScreen].bounds;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 28)];
//
    if (@available(iOS 13.0, *)) {
        
        
        view.backgroundColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [UIColor systemGray2Color];
            }
            return WXBackColor;
        }];
    } else {
        view.backgroundColor = WXBackColor;
    }
    [view addSubview:label];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    CGRect frame = [UIScreen mainScreen].bounds;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0)];
    view.backgroundColor = WXBackColor;
    return view;
}

- (CGFloat)itemH
{
    CGFloat margin = 8;
    NSInteger lineNum = 3;
    return  (kHLScreenFrameWidth - (lineNum + 2) * margin)/3.0;
}
@end
