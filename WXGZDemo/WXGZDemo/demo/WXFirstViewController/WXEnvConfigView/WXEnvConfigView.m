//
//  WXEnvConfigView.m
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 30/7/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import "WXEnvConfigView.h"
#import "WXMacro.h"
#import "HUDManager.h"
#import "WXConfigTools.h"

@interface WXEnvConfigView ()<UITextFieldDelegate>
@property(nonatomic ,strong) UITextField * firstResponderTextF;//记录将要编辑的输入框

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIView *line1;

@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIView *line2;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topMargin2;

@property (weak, nonatomic) IBOutlet UITextField *appkeyTf;
@property (weak, nonatomic) IBOutlet UITextField *acceptidTf;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UILabel *currentVersion;
@end
@implementation WXEnvConfigView
- (instancetype)init
{
    if (self = [super init]) {
    
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([WXEnvConfigView class]) owner:nil options:nil] lastObject];
     
        
        [self.btn1 setTitleColor:[UIColor colorWithRed:32/255.0 green:40/255.0 blue:49/255.0 alpha:1] forState:UIControlStateNormal];
        [self.btn1 setTitleColor:[UIColor colorWithRed:24/255.0 green:125/255.0 blue:228/255.0 alpha:1] forState:UIControlStateSelected];
        [self.btn1 setTitle:@"环境1" forState:UIControlStateNormal];
        
        [self.btn2 setTitleColor:[UIColor colorWithRed:32/255.0 green:40/255.0 blue:49/255.0 alpha:1] forState:UIControlStateNormal];
        [self.btn2 setTitleColor:[UIColor colorWithRed:24/255.0 green:125/255.0 blue:228/255.0 alpha:1] forState:UIControlStateSelected];
        [self.btn2 setTitle:@"环境2" forState:UIControlStateNormal];
        
        //监听键盘展示和隐藏的通知
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        self.appkeyTf.delegate = self;
        self.appkeyTf.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
        self.appkeyTf.leftViewMode = UITextFieldViewModeAlways;
        
        self.acceptidTf.delegate = self;
        self.acceptidTf.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
        self.acceptidTf.leftViewMode = UITextFieldViewModeAlways;
        
       
        self.saveBtn.layer.cornerRadius = 5;
        self.saveBtn.layer.masksToBounds = YES;
        
        self.clearBtn.layer.cornerRadius = 5;
        self.clearBtn.layer.masksToBounds = YES;
        
  
        if ([WXConfigTools isConfig1]) {
            [self clickbtn1:self.btn1];
        }else{
            [self clickbtn2:self.btn2];
        }
        self.currentVersion.text = [WXConfigTools getVersion];
    }
    return self;
}
- (IBAction)saveClick:(UIButton *)sender {
    
  
    if (self.btn1.isSelected) {
        [WXConfigTools setIsConfig1:YES];
    }else{
        [WXConfigTools setIsConfig1:NO];
    }
    
    if (self.appkeyTf.text.length != 0) {
        [WXConfigTools saveAppkey:self.appkeyTf.text];
    }
    if (self.acceptidTf.text.length != 0) {
        [WXConfigTools saveReportUrl:self.acceptidTf.text];
    }
    
    [HUDManager showTextHud:@"保存环境成功，重新启动后生效" afterDelay:1.4 onView:self completionBlock:^{
        exit(0);
    }];
    
    
}
//地址1
- (IBAction)clickbtn1:(UIButton *)sender {
    if (sender.isSelected) {
        return;
    }
    sender.selected = !sender.selected;
    self.btn2.selected = !sender.selected;
    if (sender.selected) {
        self.line1.backgroundColor = [UIColor colorWithRed:25/255.0 green:128/255.0 blue:228/255.0 alpha:1];
         self.line2.backgroundColor = [UIColor colorWithRed:223/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    }
    

    if ([WXConfigTools isConfig1]) {
        self.appkeyTf.text = [WXConfigTools getAppkey];
        self.acceptidTf.text = [WXConfigTools getReportUrl];
    }else{
        NSDictionary *dic = [WXConfigTools getDefault2Config];
        self.appkeyTf.text = dic[@"appkey"];
        self.acceptidTf.text = dic[@"url"];
    }
 }

// 地址2
- (IBAction)clickbtn2:(UIButton *)sender {
    if (sender.isSelected) {
        return;
    }
    sender.selected = !sender.selected;
    self.btn1.selected =  !sender.selected;
    if (sender.selected) {
        self.line2.backgroundColor = [UIColor colorWithRed:25/255.0 green:128/255.0 blue:228/255.0 alpha:1];
         self.line1.backgroundColor = [UIColor colorWithRed:223/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    }
    if (![WXConfigTools isConfig1]) {
        self.appkeyTf.text = [WXConfigTools getAppkey];
        self.acceptidTf.text = [WXConfigTools getReportUrl];
        if (self.appkeyTf.text.length == 0 || self.acceptidTf.text.length == 0) {
            NSDictionary *dic = [WXConfigTools getDefaultConfig];
            self.appkeyTf.text = dic[@"appkey"];
            self.acceptidTf.text = dic[@"url"];
        }
    }else{      
        NSDictionary *dic = [WXConfigTools getDefaultConfig];
        self.appkeyTf.text = dic[@"appkey"];
        self.acceptidTf.text = dic[@"url"];
    }

}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.firstResponderTextF isFirstResponder])[self.firstResponderTextF resignFirstResponder];
    [self endEditing:YES];
}
#pragma maek UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.firstResponderTextF = textField;//当将要开始编辑的时候，获取当前的textField
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark : UIKeyboardWillShowNotification/UIKeyboardWillHideNotification
- (void)keyboardWillShow:(NSNotification *)notification{
    CGRect rect = [self.firstResponderTextF.superview convertRect:self.firstResponderTextF.frame toView:self];//获取相对于self.view的位置
    NSDictionary *userInfo = [notification userInfo];
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];//获取弹出键盘的fame的value值
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardRect = [self convertRect:keyboardRect fromView:self.window];//获取键盘相对于self.view的frame ，传window和传nil是一样的
    CGFloat keyboardTop = keyboardRect.origin.y;
    NSNumber * animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];//获取键盘弹出动画时间值
    NSTimeInterval animationDuration = [animationDurationValue doubleValue];
    if (keyboardTop < CGRectGetMaxY(rect)) {//如果键盘盖住了输入框
        CGFloat gap = keyboardTop - CGRectGetMaxY(rect) - 10;//计算需要网上移动的偏移量（输入框底部离键盘顶部为10的间距）
        __weak typeof(self)weakSelf = self;
        [UIView animateWithDuration:animationDuration animations:^{
            weakSelf.frame = CGRectMake(weakSelf.frame.origin.x, gap, weakSelf.frame.size.width, weakSelf.frame.size.height);
        }];
    }
}
- (void)keyboardWillHide:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    NSNumber * animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];//获取键盘隐藏动画时间值
    NSTimeInterval animationDuration = [animationDurationValue doubleValue];
    if (self.frame.origin.y < 0) {//如果有偏移，当影藏键盘的时候就复原
        __weak typeof(self)weakSelf = self;
        [UIView animateWithDuration:animationDuration animations:^{
            weakSelf.frame = CGRectMake(weakSelf.frame.origin.x, 88, weakSelf.frame.size.width, weakSelf.frame.size.height);
        }];
    }
}
- (void)layoutSubviews
{

    if (kHLScreenFrameWidth == 320) {
        self.topMargin2.constant = 80;
    }else{
        self.topMargin2.constant = 108;
    }
}
@end
