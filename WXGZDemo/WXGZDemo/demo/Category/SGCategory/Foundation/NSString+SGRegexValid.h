//
//  NSString+RegexValid.h
//  SGCategory
//
//  Created by Shangen Zhang on 2018/2/2.
//


#import <Foundation/Foundation.h>

@interface NSString (RegexValid)

/**
 是否符合正则

 @param regex 正则表达式
 @return YES 符合该正则 NO 不符合
 */
- (BOOL)isValidWithRegex:(NSString *)regex;
@end


@interface NSString (CommonValid)
//数字或者字母
- (BOOL)isLetterOrNumValid;

//数字
- (BOOL)isNumberValid;

//字母
- (BOOL)isLetterValid;

/**
 金额判断
 */
- (BOOL)isMoneyAmountValid;

/**
 验证手机号
 */
- (BOOL)isMoblePhoneValid;


// 固定电话
- (BOOL)isTelePhoneValid;

/**
 验证电话  手机或者电话号码
 */
- (BOOL)isPhoneValid;

/**
 是否是邮箱
 */
- (BOOL)isEmailValid;

/**
 身份证
 */
- (BOOL)isIDCardValid;


/**
 是否包含特殊字符
 */
- (BOOL)isContainSpecialChar;

@end
