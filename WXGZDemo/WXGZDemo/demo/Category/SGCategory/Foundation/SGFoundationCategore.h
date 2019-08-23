//
//  SGFoundationCategory.h
//  SGCategory
//
//  Created by Shangen Zhang on 2017/8/17.
//  Copyright © 2017 Shangen Zhang. All rights reserved.
//

#ifndef SGFoundationCategory_h
#define SGFoundationCategory_h

#import "NSArray+SGArrayFormSet.h"
#import "NSMutableArray+SGAddObject.h"
#import "NSMutableDictionary+SGSetObjc.h"
#import "NSObject+SGSelector.h"
#import "NSString+SGHash.h"
#import "NSString+SGRegex.h"
#import "NSString+SGRegexValid.h"
#import "NSString+SGRemoveSprit.h"
#import "NSString+SGMoney.h"

// 沙盒路径
#define DocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define CachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]

// 系统判断
#define IOS_LATTER(sys) (@available(iOS sys, *))

#endif /* SGFoundationCategory_h */
