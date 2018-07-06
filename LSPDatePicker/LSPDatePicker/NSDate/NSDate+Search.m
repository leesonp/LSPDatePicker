//
//  NSDate+Search.m
//  LSPDatePicker
//
//  Created by leeson on 2018/3/6.
//  Copyright © 2018年 李斯芃 ---> 512523045@qq.com. All rights reserved.
//

#import "NSDate+Search.h"

@implementation NSDate (Search)

+ (NSString *)todayString {
    return [[NSDate date] stringWithFormat:@"yyyy-MM-dd"];
}

+ (NSString *)daysStringSinceNow:(NSInteger)days {
    return [[NSDate dateWithTimeIntervalSinceNow:24*60*60*days] stringWithFormat:@"yyyy-MM-dd"];
}

@end
