//
//  Model.h
//  LSPDatePicker
//
//  Created by leeson on 2018/3/9.
//  Copyright © 2018年 李斯芃 ---> 512523045@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

///MARK: - --- 传入格式化时间字符串 返回分割后的数组
+ (NSArray *)formatDeteWithSting:(NSString*)dateString;

@property (nonatomic,copy) NSString *dateStr;

@end
