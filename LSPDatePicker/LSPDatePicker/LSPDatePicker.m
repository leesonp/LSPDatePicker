//
//  LSPDatePicker.m
//  LSPDatePicker
//
//  Created by leeson on 2018/3/6.
//  Copyright © 2018年 李斯芃 ---> 512523045@qq.com. All rights reserved.
//

#import "LSPDatePicker.h"

#define TEXT_COLOR   COLOR_RGBA(61, 147, 236, 1)
#define COLOR_RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define Font(size)      [UIFont systemFontOfSize:size]
#define DateFormatDic(dateType) @{@0:@"yyyy-MM-dd",@1:@"yyyy-MM-dd HH:mm",@2:@"yyyy/MM/dd HH:mm:ss",@3:@"yyyy/MM/dd HH:mm EEE"}[dateType]

@interface LSPDatePicker ()

@property (strong, nonatomic) UIView *maskView;
@property (strong, nonatomic) UIView *pickerConten;
@property (strong, nonatomic) UIDatePicker *picker;
@property (strong, nonatomic) UIView *toolBar;
@property (strong, nonatomic) UIButton *sure;
@property (strong, nonatomic) UIButton *cancle;
@property (assign, nonatomic) NSInteger dateType;

@end

@implementation LSPDatePicker

//初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.maskView = [[UIView alloc] init];
        self.maskView.backgroundColor = COLOR_RGBA(0, 0, 0, 0.05);
        [self addSubview:self.maskView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideViews)];
        [self.maskView addGestureRecognizer:tap];
        
        [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        self.pickerConten = [[UIView alloc] init];
        [self addSubview:self.pickerConten];
        
        [self.pickerConten mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(220);
        }];
        
        self.picker = [[UIDatePicker alloc] init];
        self.picker.datePickerMode = UIDatePickerModeDate;
        self.picker.date = [NSDate date];
        self.picker.backgroundColor = [UIColor whiteColor];
        [self.pickerConten addSubview:self.picker];
        
        [self.picker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(190);
        }];
        
        self.toolBar = [[UIView alloc] init];
        self.toolBar.backgroundColor = [UIColor whiteColor];
        [self.pickerConten addSubview:self.toolBar];
        
        [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(self.picker.mas_top);
            make.height.mas_equalTo(30);
        }];
        
        self.cancle = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.cancle.titleLabel.font = Font(15);
        self.cancle.tag = 1;
        [self.cancle setTitleEdgeInsets:(UIEdgeInsets){0, 15, 0, 0}];
        [self.cancle setTitleColor:TEXT_COLOR forState:UIControlStateNormal];
        [self.cancle setTitle:@"取消" forState:UIControlStateNormal];
        [self.pickerConten addSubview:self.cancle];
        
        [self.cancle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(self.toolBar);
            make.right.mas_equalTo(self.toolBar.mas_centerX);
        }];
        
        self.sure = [UIButton buttonWithType:UIButtonTypeCustom];
        self.sure.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        self.sure.titleLabel.font = Font(15);
        self.sure.tag = 2;
        [self.sure setTitleEdgeInsets:(UIEdgeInsets){0, 0, 0, 15}];
        [self.sure setTitleColor:TEXT_COLOR forState:UIControlStateNormal];
        [self.sure setTitle:@"确定" forState:UIControlStateNormal];
        [self.pickerConten addSubview:self.sure];
        
        [self.sure mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.mas_equalTo(self.toolBar);
            make.left.mas_equalTo(self.toolBar.mas_centerX);
        }];
        
        [self.cancle addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.sure addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

//外部调用
+ (LSPDatePicker *)showInView:(UIView *)view selectedCallBack:(DateChooseCallBack)callBack {
    LSPDatePicker *datePicker = [[LSPDatePicker alloc] initWithFrame:view.bounds];
    datePicker.dateChooseCallBack = callBack;
    [view addSubview:datePicker];
    
    datePicker.pickerConten.transform = CGAffineTransformMakeTranslation(0, 220);
    datePicker.maskView.alpha = 0;
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        datePicker.pickerConten.transform = CGAffineTransformIdentity;
        datePicker.maskView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
    
    return datePicker;
}

//MARK: - --- 隐藏视图
- (void)hideViews{
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.pickerConten.transform = CGAffineTransformMakeTranslation(0, 220);
        self.maskView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

}

//MARK: - --- 取消、确定按钮点击事件
- (void)buttonDidClick:(UIButton *)button {
    if (button.tag == 1) {
        [self hideViews];
    }else {
        if (self.dateChooseCallBack) {
            //返回的时间格式
            self.dateChooseCallBack([self.picker.date stringWithFormat:DateFormatDic(@(self.dateType))]);
            [self hideViews];
        }
    }
}

//MARK: - --- 链式编程思想，改变初始值
- (LSPDatePicker * (^)(NSInteger dateType,NSString *dateStr))dateStyle{
    return ^LSPDatePicker *(NSInteger dateType,NSString *dateStr) {
        if (dateType == DateTypeHM || dateType == DateTypeHMS || dateType == DateTypeWEEK) {
            self.dateType = dateType;
            self.picker.datePickerMode = UIDatePickerModeDateAndTime;
        }else if (dateType == DateTypeMYD){
            dateStr = [dateStr componentsSeparatedByString:@" "][0];
        }
        self.picker.date = [NSDate dateWithString:dateStr format:DateFormatDic(@(self.dateType))];
        return self;
    };
}

@end
