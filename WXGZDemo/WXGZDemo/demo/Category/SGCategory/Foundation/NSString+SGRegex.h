//
//  NSString+SGRegex.h
//  SGCategory
//
//  Created by Shangen Zhang on 2017/5/10.
//  Copyright © 2017 Shangen zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SGRegex)
/**
 正则字符替换 --根据正则表达式找出字符串中所符合正则要求的并用某个字符串替换该字符
 例如: [str replaceRegexStr:@"[^0-9a-zA-Z]" withReplaceString:@""];
 返回的字符串 就会把‘str’ 中不是0-9或者不是字母的字符去掉
 
 @param regexStr 要替换的字符串的正则表达式
 @param replaceStr 替换后的字符串
 @return 替换后的新的字符串
 */
- (instancetype)sg_replaceRegexStr:(NSString *)regexStr
                 withReplaceString:(NSString *)replaceStr;
@end
