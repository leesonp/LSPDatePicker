//
//  LSPDatePicker.h
//  LSPDatePicker
//
//  Created by leeson on 2018/3/6.
//  Copyright © 2018年 李斯芃 ---> 512523045@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "NSDate+Ex.h"
#import "NSDate+Search.h"

typedef NS_ENUM(NSUInteger, DateType) {
    ///yyyy-MM-dd
    DateTypeMYD      = 0,
    ///yyyy-MM-dd HH:mm
    DateTypeHM      = 1,
    ///yyyy/MM/dd HH:mm:ss
    DateTypeHMS      = 2,
    ///yyyy/MM/dd HH:mm EEE
    DateTypeWEEK      = 3,
};

typedef void(^DateChooseCallBack)(NSString *date);

@interface LSPDatePicker : UIView

///block返回时间
@property (copy, nonatomic) DateChooseCallBack dateChooseCallBack;

///MARK: - --- 外部调用API
+ (LSPDatePicker*)showInView:(UIView *)view selectedCallBack:(DateChooseCallBack)callBack;

///MARK: - --- 链式编程扩展方法(传入类型，时间并且要求两者格式一致)
- (LSPDatePicker * (^)(NSInteger dateType,NSString *dateStr))dateStyle;

@end
