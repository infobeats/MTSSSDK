//
//  NSDate+SGExtension.m
//  SGCategory
//
//  Created by Shangen Zhang  on 2017/8/11.
//  Copyright © 2017年 Shangen zhang. All rights reserved.
//

#import "NSDate+SGExtension.h"

@implementation NSDate (Formatter)

+ (instancetype)dateFromString:(NSString *)dateString WithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    return [dateFormatter dateFromString:dateString];
}

+ (NSString *)currentDateStringWithFormat:(NSString *)format {
    return [[self date] dateStringWithFormat:format];
}

- (NSString *)dateStringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}


@end




@implementation NSDate (GetCurrentTime)

#pragma mark - 获取系统当前的时间戳，即当前时间距1970的秒数（以毫秒为单位）
+ (NSString *)currentTimestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    /** 当前时间距1970的秒数。*1000 是精确到毫秒，不乘就是精确到秒 */
    NSTimeInterval interval = [date timeIntervalSince1970] * 1000;
    NSString *timeString = [NSString stringWithFormat:@"%0.f", interval];
    
    return timeString;
}

#pragma mark - 获取当前的时间
+ (NSString *)currentDateString {
    return [self currentDateStringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}
+ (double )currentTimestamp2
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    /** 当前时间距1970的秒数。*1000 是精确到毫秒，不乘就是精确到秒 */
    NSTimeInterval interval = [date timeIntervalSince1970];
    return interval;
}

#pragma mark - 按指定格式获取当前的时间


+ (NSString *)currentYearString {
    return [self currentDateStringWithFormat:@"yyyy"];
}
+ (NSString *)currentMonthString {
    return [self currentDateStringWithFormat:@"MM"];
}
+ (NSString *)currentDayString {
    return [self currentDateStringWithFormat:@"dd"];
}
+ (NSString *)currentWeekDayString {
    return [NSString stringWithFormat:@"%zd",[self currentWeekDay]];
}

+ (NSInteger)currentYear {
    return [[self currentYearString] integerValue];
}
+ (NSInteger)currentMonth {
    return [[self currentMonthString] integerValue];
}
+ (NSInteger)currentDay {
    return [[self currentDayString] integerValue];
}
+ (NSInteger)currentWeekDay {
    
    NSDateComponents * comps =
    [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal fromDate:[NSDate date]];
    
    return [comps weekday] - 1; // 今年的第几周
}

@end



@implementation NSDate (BRAdd)

#pragma mark - 返回指定时间差值的日期字符串
+ (NSString *)dateStringWithDelta:(NSTimeInterval)delta {
    return [[NSDate dateWithTimeIntervalSinceNow:delta] dateStringWithFormat: @"yyyy-MM-dd HH:mm:ss"];
}

//计算两个日期之间的天数
+ (NSInteger)deltaDaysFrombeginDate:(NSString *)beginDateString endDate:(NSString *)endDateString {
    //创建日期格式化对象
    NSDate *beginDate = [self dateFromString:beginDateString WithFormat:@"yyyy-MM-dd"];
    NSDate *endDate   = [self dateFromString:endDateString WithFormat:@"yyyy-MM-dd"];
    
    //取两个日期对象的时间间隔
    NSTimeInterval deltaTime = [endDate timeIntervalSinceDate:beginDate];
    NSInteger days = (NSInteger)deltaTime / (24 * 60 * 60); // 60s * 60min * 24h
 
    return days;
}

#pragma mark - 返回 指定时间加指定天数 结果日期字符串
+ (NSString *)date:(NSString *)dateString formatter:(NSString *)formatterStr addDays:(NSInteger)days {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = formatterStr; //yyyy-MM-dd
    NSDate *myDate = [dateFormatter dateFromString:dateString];
    NSDate *newDate = [myDate dateByAddingTimeInterval:60 * 60 * 24 * days];
    //NSDate *newDate = [NSDate dateWithTimeInterval:60 * 60 * 24 * days sinceDate:myDate];
    NSString *newDateString = [dateFormatter stringFromDate:newDate];
    //HBLog(@"%@", newDateString);
    return newDateString;
}

#pragma mark - 返回日期格式字符串  @"2016-10-16 14:30:30"  @"yyyy-MM-dd HH:mm:ss"
// 注意：一个日期字符串必须 与 它相应的日期格式对应，这个才能被系统识别为日期
+ (NSString *)dateDescriptionWithTargetDate:(NSString *)dateStr andTargetDateFormat:(NSString *)dateFormatStr {
    // 1.获取当前时间
    NSDate *currentDate = [NSDate date];
    // 2.目标时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormatStr;
    NSDate *targetDate = [formatter dateFromString:dateStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *returnFormatter = [[NSDateFormatter alloc] init];
    if ([calendar isDate:targetDate equalToDate:currentDate toUnitGranularity:NSCalendarUnitYear]) {
        if ([calendar isDateInToday:targetDate]) {
            NSDateComponents *components = [calendar components:NSCalendarUnitMinute | NSCalendarUnitHour fromDate:targetDate toDate:currentDate options:0];
            if (components.hour == 0) {
                if (components.minute == 0) {
                    return @"刚刚";
                } else {
                    return [NSString stringWithFormat:@"%ld分钟前", (long)components.minute];
                }
            } else {
                return [NSString stringWithFormat:@"%ld小时前", (long)components.hour];
            }
        } else if ([calendar isDateInYesterday:targetDate]) {
            return @"昨天";
        } else {
            returnFormatter.dateFormat = @"M-d";
            return [returnFormatter stringFromDate:targetDate];
        }
    } else {
        returnFormatter.dateFormat = @"yyyy-M-d";
        return [returnFormatter stringFromDate:targetDate];
    }
    return nil;
}

@end


