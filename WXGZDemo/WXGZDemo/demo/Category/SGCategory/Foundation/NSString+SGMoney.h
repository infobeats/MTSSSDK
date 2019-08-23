//
//  NSString+Money.h
//  SGCategory
//
//  Created by Shangen Zhang on 2018/2/28.
//

#import <Foundation/Foundation.h>

@interface NSString (Money)
// 千分位格式化
- (NSString *)sg_positiveString;

// 元转换成分 10.00 -----> 10000 不格式化
- (NSString *)sg_fenString;

// 分转换成元 10000 ----> 100.00 不格式化
- (NSString *)sg_yuanString;

// 分转换成元再千分格式化 1000000 ----> 1000,0.00
- (NSString *)sg_yuanStringWithPositiveFormat;

// 分转换成元再千分格式化 带上+ 或者 -
- (NSString *)sg_yuanStringWithPositiveAndSignSymbolFormat;

@end
