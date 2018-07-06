//
//  ViewController.m
//  LSPDatePicker
//
//  Created by leeson on 2018/3/6.
//  Copyright © 2018年 李斯芃 ---> 512523045@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "LSPDatePicker.h"
#import "DateCell.h"
#import "Model.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArrM;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"DateCell" bundle:nil] forCellReuseIdentifier:@"DateCell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArrM.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DateCell"];
    if (cell == nil) {
        cell = [[DateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DateCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Model *model = self.dataArrM[indexPath.row];
    cell.model = model;
    __weak __typeof(&*cell) weakCell = cell;
    [cell setCallBack:^() {
        LSPDatePicker *datePicker = [LSPDatePicker showInView:self.view selectedCallBack:^(NSString *date) {
            //返回时间date 格式为@"yyyy/MM/dd HH:mm:ss"或者@"yyyy-MM-dd HH:mm:ss"可用此模型model，若要展示其它样式请自行至文件：Model.m 里做相应修改
            model.dateStr = date;
            //更新数据源
            [self.dataArrM replaceObjectAtIndex:indexPath.row withObject:model];
            weakCell.model = model;
        }];
        
        /*
         切记：
            dateStyle(参数1,参数2)里的参数1和参数2的格式要统一，不然会造成程序崩溃
         */
        datePicker.dateStyle(DateTypeHMS,model.dateStr);
    }];
    
    return cell;
}

//MARK: - --- 数据懒加载
- (NSMutableArray *)dataArrM{
    if (!_dataArrM) {
        _dataArrM = [NSMutableArray array];
        for (NSInteger i = 0; i < 10; i++) {
            Model *model = [Model new];
            model.dateStr = model.dateStr = [NSString stringWithFormat:@"2019-03-%02zi 14:22:22",i+1];//yyyy-MM-dd HH:mm:ss服务器时间，注意格式
            [_dataArrM addObject:model];
        }
    }
    return _dataArrM;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
