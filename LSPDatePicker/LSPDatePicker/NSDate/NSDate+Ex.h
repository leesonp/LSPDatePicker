//
//  NSDate+Ex.h
//  LSPDatePicker
//
//  Created by leeson on 2018/3/6.
//  Copyright © 2018年 李斯芃 ---> 512523045@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Ex)

+ (instancetype)dateWithString:(NSString *)string format:(NSString *)format;
- (NSString *)stringWithFormat:(NSString *)format;

@end
