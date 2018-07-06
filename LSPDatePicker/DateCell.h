//
//  DateCell.h
//  LSPDatePicker
//
//  Created by leeson on 2018/3/9.
//  Copyright © 2018年 李斯芃 ---> 512523045@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

typedef void(^CallBack)(void);

@interface DateCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *ymdDate;
@property (weak, nonatomic) IBOutlet UILabel *hmTime;
@property (weak, nonatomic) IBOutlet UILabel *week;

@property (nonatomic, strong) Model *model;
@property (weak, nonatomic) IBOutlet UIButton *modifyBt;

@property (nonatomic,copy) CallBack callBack;

@end
