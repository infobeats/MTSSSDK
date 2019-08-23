//
//  NSString+SGSize.h
//  SGCategory
//
//  Created by Shangen Zhang on 16/12/13.
//  Copyright © 2016年 Shangen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (SGSize)
    /**
     *  根据字体计算文字size（文字不换行）
     */
- (CGSize)sizeWith_Font:(UIFont *)font;
    
    /**
     *  根据字体，和文字最大宽度计算文字size
     */
- (CGSize)sizeWith_Font:(UIFont *)font
             andMaxWith:(CGFloat)maxWidth;
    
    /**
     *  根据字体，和文字最大宽度计算文字高度
     */
- (CGFloat)textHeightWith_Font:(UIFont *)font
                   andMaxWidth:(CGFloat)maxWidth;
    
@end
