//
//  Model.m
//  LSPDatePicker
//
//  Created by leeson on 2018/3/9.
//  Copyright © 2018年 李斯芃 ---> 512523045@qq.com. All rights reserved.
//

#import "Model.h"
#import "NSDate+Ex.h"

@implementation Model

///MARK: - --- 传入格式化时间字符串 返回分割后的数组
+ (NSArray *)formatDeteWithSting:(NSString*)dateString{
    //分割字符串
    dateString = [self stingFormatToSting:dateString];
    NSMutableArray *elements = [NSMutableArray arrayWithArray:[dateString componentsSeparatedByString:@" "]];
    //获取当前时间
    NSDate *date = [NSDate date];
    NSString *todayStr = [date stringWithFormat:@"yyyy/MM/dd"];
    //当前时间转时间戳
    NSTimeInterval nowTimeinterval = [self returnTimeIntrval:todayStr andFormatter:@"yyyy/MM/dd"];
    //选择器返回时间转时间戳
    NSTimeInterval showTimeinterval = [self returnTimeIntrval:elements[0] andFormatter:@"yyyy/MM/dd"];
    NSString *showYear = [self timeBeforeInfoWithString:showTimeinterval andNowTimeinterval:nowTimeinterval];
    if (showYear) {
        [elements replaceObjectAtIndex:0 withObject:showYear];
    }
    return elements;
}

///MARK: - --- 计算时间差
+ (NSString *)timeBeforeInfoWithString:(NSTimeInterval)timeIntrval andNowTimeinterval:(NSTimeInterval)nowTimeinterval{
    NSInteger timeInt = timeIntrval - nowTimeinterval; //时间差
    NSInteger day = timeInt / (3600 * 24);
    if (day == 0) {
        return @"今天";
    }else if(day == 1){
        return @"明天";
    }else if(day == 2){
        return @"后天";
    }
    return nil;
}

///MARK: - --- 时间字符串转时间戳
+ (NSInteger)returnTimeIntrval:(NSString *)date andFormatter:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置系统时区
    NSTimeZone* timeZone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:timeZone];
    //指定时间显示样式: HH表示24小时制 hh表示12小时制
    [formatter setDateFormat:format];
    NSDate *lastDate = [formatter dateFromString:date];
    NSInteger interval = [timeZone secondsFromGMTForDate:lastDate];
    lastDate = [lastDate  dateByAddingTimeInterval: interval];
    //以 1970/01/01 GMT为基准，得到lastDate的时间戳
    long firstStamp = [lastDate timeIntervalSince1970];
    return firstStamp;
}

///MARK: - --- 时间字符串格式化为另一种时间字符串
+ (NSString *)stingFormatToSting:(NSString *)timeSting{
    NSDate *lastDate = [NSDate dateWithString:timeSting format:@"yyyy-MM-dd HH:mm:ss"];
    NSString *todayStr = [lastDate stringWithFormat:@"yyyy/MM/dd HH:mm EEE"];
    return todayStr;
}

@end
