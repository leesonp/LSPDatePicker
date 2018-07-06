//
//  NSDate+Ex.m
//  LSPDatePicker
//
//  Created by leeson on 2018/3/6.
//  Copyright © 2018年 李斯芃 ---> 512523045@qq.com. All rights reserved.
//

#import "NSDate+Ex.h"

@implementation NSDate (Ex)

+ (instancetype)dateWithString:(NSString *)string format:(NSString *)format {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    NSDate *date =[dateFormat dateFromString:string];
    
    return date;
}

- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = format;
    NSString *date = [dateFormat stringFromDate:self];
    
    return date;
}

@end
