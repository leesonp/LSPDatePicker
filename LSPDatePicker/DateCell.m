//
//  DateCell.m
//  LSPDatePicker
//
//  Created by leeson on 2018/3/9.
//  Copyright © 2018年 李斯芃 ---> 512523045@qq.com. All rights reserved.
//

#import "DateCell.h"

@implementation DateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(Model *)model{
    if (model.dateStr.length > 0) {
        NSArray *ele = [Model formatDeteWithSting:model.dateStr];
        self.ymdDate.text = ele[0];
        self.hmTime.text = ele[1];
        self.week.text = ele[2];
    }else{
        self.ymdDate.text = @"--";
        self.hmTime.text = @"--:--";
        self.week.text = @"--";
    }
    
}

- (IBAction)modifyBtAction:(UIButton *)sender {
    self.callBack();
}
//http://10.0.126.65:8083/scc-server-portal/aircap/

@end
