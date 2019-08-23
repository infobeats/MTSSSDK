//
//  NSString+RegexValid.m
//  SGCategory
//
//  Created by Shangen Zhang on 2018/2/2.
//

#import "NSString+SGRegexValid.h"

@implementation NSString (RegexValid)
- (BOOL)isValidWithRegex:(NSString *)regex {
    
    if (![regex isKindOfClass:NSString.class] || regex.length == 0) {
#ifdef DEBUG
        // 抛异常
#endif
        return NO;
    }
    
    if (self.length == 0) return NO;
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}
@end


@implementation NSString (CommonValid)
//数字或者字母
- (BOOL)isLetterOrNumValid {
    return [self isValidWithRegex:@"[a-zA-Z0-9]*"];
}

//数字
- (BOOL)isNumberValid {
    return [self isValidWithRegex:@"[0-9]*"];
}

//字母
- (BOOL)isLetterValid {
    return [self isValidWithRegex:@"[a-zA-Z]*"];
}

// 金额
- (BOOL)isMoneyAmountValid {
    //只能包含数字和小数点
    //最多一个小数点
    //小数点后面最多两位数字
    //数值要大于零
    return
    [self isValidWithRegex:@"^[0-9]{1,5}(\\.[0-9]{1,2})?$"] &&
    //判断以0开头，第二位不能为0
    [self isValidWithRegex:@"^([0\\.]+)|(0[0-9]+.*)$"];
}


//手机
- (BOOL)isMoblePhoneValid {
    return [self isValidWithRegex:@"^1[3,4,5,7,8]\\d{9}$"];
}


// 固定电话
- (BOOL)isTelePhoneValid {
    return [self isValidWithRegex:@"0\\d{2,3}-\\d{5,9}|0\\d{2,3}-\\d{5,9}"];
}

// 电话号码
- (BOOL)isPhoneValid
{
    return [self isMoblePhoneValid] || [self isTelePhoneValid];
}




- (BOOL)isEmailValid {
    return [self isValidWithRegex:@"\\w[-\\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}"];
}


- (BOOL)isIDCardValid {
    return
    [self isValidWithRegex:@"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$"] ||
    [self isValidWithRegex:@"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$"];
}



// 是否包含特殊字符
- (BOOL)isContainSpecialChar {
    
    return NO;
}
@end
