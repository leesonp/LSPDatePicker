//
//  NSDate+Search.h
//  LSPDatePicker
//
//  Created by leeson on 2018/3/6.
//  Copyright © 2018年 李斯芃 ---> 512523045@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+Ex.h"

@interface NSDate (Search)

+ (NSString *)todayString;
+ (NSString *)daysStringSinceNow:(NSInteger)days;

@end
