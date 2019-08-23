//
//  NSString+SGHash.m
//  SGCategory
//
//  Created by Shangen Zhang on 13-09-26.
//  Copyright (c) 2013年 Shangen zhang. All rights reserved.
//

#import "NSString+SGHash.h"
#import <CommonCrypto/CommonDigest.h>



#define FileHashDefaultChunkSizeForReadingData 1024*8

@implementation NSString (SGHash)

- (NSString *)sg_md5String {
    
    const char *str = self.UTF8String;
    
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), bytes);
    
    return create_md5_string(bytes, CC_MD5_DIGEST_LENGTH);
}

+ (NSString*)sg_hashStringForData:(NSData*)data {
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, (CC_LONG)data.length, bytes);
    return create_md5_string(bytes, CC_MD5_DIGEST_LENGTH);
}

+(NSString*)sg_getFileMD5WithPath:(NSString*)path {
    if (path.length == 0) {
        return @"";
    }
    return (__bridge_transfer NSString *)lyt_FileMD5HashCreateWithPath((__bridge CFStringRef)path,FileHashDefaultChunkSizeForReadingData);
}


static NSString * create_md5_string(unsigned char * bytes,uint32_t length) {

    // 创建字符串
    NSMutableString* output = [NSMutableString string];
    
    // 拼接字符
    for (int i = 0; i < length; i++)  [output appendFormat:@"%02x", bytes[i]];
    
    // 返回
    return [NSString stringWithFormat:@"%@",output];
}

static CFStringRef lyt_FileMD5HashCreateWithPath(CFStringRef filePath,size_t chunkSizeForReadingData) {
    // Declare needed variables
    CFStringRef result = NULL;
    CFReadStreamRef readStream = NULL;
    // Get the file URL
    CFURLRef fileURL =
    CFURLCreateWithFileSystemPath(kCFAllocatorDefault,
                                  (CFStringRef)filePath,
                                  kCFURLPOSIXPathStyle,
                                  (Boolean)false);
    
    if (!fileURL) goto done;
    // Create and open the read stream
    readStream = CFReadStreamCreateWithFile(kCFAllocatorDefault,
                                            (CFURLRef)fileURL);
    
    if (!readStream) goto done;
    bool didSucceed = (bool)CFReadStreamOpen(readStream);
    if (!didSucceed) goto done;
    // Initialize the hash object
    CC_MD5_CTX hashObject;
    CC_MD5_Init(&hashObject);
    // Make sure chunkSizeForReadingData is valid
    if (!chunkSizeForReadingData) {
        chunkSizeForReadingData = FileHashDefaultChunkSizeForReadingData;
    }
    
    // Feed the data to the hash object
    
    bool hasMoreData = true;
    
    while (hasMoreData) {
        
        uint8_t buffer[chunkSizeForReadingData];
        
        CFIndex readBytesCount = CFReadStreamRead(readStream,(UInt8 *)buffer,(CFIndex)sizeof(buffer));
        
        if (readBytesCount == -1) break;
        
        if (readBytesCount == 0) {
            
            hasMoreData = false;
            
            continue;
            
        }
        
        CC_MD5_Update(&hashObject,(const void *)buffer,(CC_LONG)readBytesCount);
        
    }
    // Check if the read operation succeeded
    didSucceed = !hasMoreData;
    // Compute the hash digest
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5_Final(digest, &hashObject);
    
    // Abort if the read operation failed
    
    if (!didSucceed) goto done;
    
    // Compute the string result
    
    char hash[2 * sizeof(digest) + 1];
    
    for (size_t i = 0; i < sizeof(digest); ++i) {
        
        snprintf(hash + (2 * i), 3, "%02x", (int)(digest[i]));
        
    }
    
    result = CFStringCreateWithCString(kCFAllocatorDefault,(const char *)hash,kCFStringEncodingUTF8);
    
done:
    
    if (readStream) {
        
        CFReadStreamClose(readStream);
        
        CFRelease(readStream);
    }
    
    if (fileURL) {
        
        CFRelease(fileURL);
        
    }
    
    return result;
}
@end
