//
//  NSDate+SGExtension.h
//  SGCategory
//
//  Created by Shangen Zhang  on 2017/8/11.
//  Copyright © 2017年 Shangen zhang. All rights reserved.
//

#import <Foundation/Foundation.h>


// yyyy-MM-dd hh:mm:ss  12小时制
// yyyy-MM-dd HH:mm:ss  24小时制
// yyyy-MM-dd HH:mm:ss.SSS  (SSS毫秒)
@interface NSDate (Formatter)

+ (instancetype)dateFromString:(NSString *)dateString WithFormat:(NSString *)format;

+ (NSString *)currentDateStringWithFormat:(NSString *)format;

- (NSString *)dateStringWithFormat:(NSString *)format;
@end

@interface NSDate (GetCurrentTime)
/** 获取系统当前的时间戳，即当前时间距1970的秒数（以毫秒为单位） */
+ (NSString *)currentTimestamp;

/** 获取当前的时间 yyyy-MM-dd HH:mm:ss */
+ (NSString *)currentDateString;

/**
 获取当前的时间
 */
+ (double )currentTimestamp2;
/**
 当前 年（2018） 月（1） 日（1） 周几（0表示星期天、1表示星期一。。。）
 */
+ (NSString *)currentYearString;
+ (NSString *)currentMonthString;
+ (NSString *)currentDayString;
+ (NSString *)currentWeekDayString;

+ (NSInteger)currentYear;
+ (NSInteger)currentMonth;
+ (NSInteger)currentDay;
+ (NSInteger)currentWeekDay;
@end



@interface NSDate (BRAdd)

/**
 *  计算两个日期之间的天数
 *
 *  @param  beginDateString     设置格式：yyyy-MM-dd
 *  @param  endDateString       设置格式：yyyy-MM-dd
 */
+ (NSInteger)deltaDaysFrombeginDate:(NSString *)beginDateString endDate:(NSString *)endDateString;

/**
 *  返回指定时间差值的日期字符串
 *
 *  @param delta 时间差值
 *  @return 日期字符串，格式：yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)dateStringWithDelta:(NSTimeInterval)delta;

/**
 *  指定时间加指定天数
 *
 *  @param dateString  日期
 *  @param days        天数
 *  @return 日期字符串，格式：yyyy-MM-dd
 */
+ (NSString *)date:(NSString *)dateString formatter:(NSString *)formatterStr addDays:(NSInteger)days;

/**
 *  返回日期格式字符串
 *
 *  @param dateStr 需要转换的时间点
 *  @return 日期字符串
 *    返回具体格式如下：
 *      - 刚刚(一分钟内)
 *      - X分钟前(一小时内)
 *      - X小时前(当天)
 *      - MM-dd HH:mm(一年内)
 *      - yyyy-MM-dd HH:mm(更早期)
 */
+ (NSString *)dateDescriptionWithTargetDate:(NSString *)dateStr andTargetDateFormat:(NSString *)dateFormatStr;

@end




