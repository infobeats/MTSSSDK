//
//  NSString+SGHash.h
//  SGCategory
//
//  Created by Shangen Zhang on 13-09-26.
//  Copyright (c) 2013年 Shangen zhang. All rights reserved.
//
/**
 * 命令行测试命令
 *
 * MD5
 * $ echo -n abc | openssl md5
 * SHA1
 * $ echo -n abc | openssl sha1
 * SHA256
 * $ echo -n abc | openssl sha -sha256
 * SHA512
 * $ echo -n abc | openssl sha -sha512
 *
 * 说明：abc是要加密的字符串
 */

#import <Foundation/Foundation.h>

@interface NSString (SGHash)

//  MD5
- (NSString *)sg_md5String;

// data 二进制 MD5
+ (NSString*)sg_hashStringForData:(NSData*)data;

//获取文件的md5
+ (NSString *)sg_getFileMD5WithPath:(NSString *)filePath;

@end
