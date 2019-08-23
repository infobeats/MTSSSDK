//
//  NSString+Money.m
//  SGCategory
//
//  Created by Shangen Zhang on 2018/2/28.
//

#import "NSString+SGMoney.h"

@implementation NSString (Money)

// 千分位格式化带两位小数点
- (NSString *)sg_positiveString {
    
    double doubleValue = [self doubleValue];
    
    // 等于0
    if (doubleValue == 0) return @"0.00";
    
    // 绝对值小于 1000的
    if (ABS(doubleValue) < 1000 ) return  [NSString stringWithFormat:@"%.2f",doubleValue];
    
    // 千分格式化
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@",###.00;"];
    return [numberFormatter stringFromNumber:[NSNumber numberWithDouble:doubleValue]];
}

//分转换成元
- (NSString *)sg_yuanString {
    //    1000分---->10.00元
    NSDecimalNumber *dTestNumber1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *dTestNumber2 = [NSDecimalNumber decimalNumberWithString:@"100"];
    return  [[dTestNumber1 decimalNumberByDividingBy:dTestNumber2] stringValue];
}

//元转换成分
- (NSString *)sg_fenString {
    //    10元---->1000分
    NSDecimalNumber *dTestNumber1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *dTestNumber2 = [NSDecimalNumber decimalNumberWithString:@"100"];
    return [[dTestNumber1 decimalNumberByMultiplyingBy:dTestNumber2] stringValue];
}


- (NSString *)sg_yuanStringWithPositiveFormat {
    return [[self sg_yuanString] sg_positiveString];
}

- (NSString *)sg_yuanStringWithPositiveAndSignSymbolFormat {
    NSString *str = [self sg_yuanStringWithPositiveFormat];
    return [str hasPrefix:@"-"] ? str : [NSString stringWithFormat:@"+%@",str];
}

@end
