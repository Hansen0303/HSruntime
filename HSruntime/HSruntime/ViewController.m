//
//  ViewController.m
//  HSruntime
//
//  Created by hansen on 16/5/31.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "ViewController.h"
#import "MethodExchangeVC.h"
#import "MsgViewController.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) UITableView    * tableView;

@property (nonatomic, strong) NSMutableArray * listData;

@end

@implementation ViewController


- (NSMutableArray *)listData
{
    if (_listData == nil) {
        _listData = [NSMutableArray arrayWithObjects:@"message",@"MethodExchange", nil];
        
    }
    
    return _listData;
}


- (UITableView *)tableView
{
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    
    return _tableView;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];

    

      
    
}


#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.listData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIndetifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndetifier];
        
    }
    

    cell.textLabel.text  = self.listData[indexPath.row];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    if (indexPath.row == 0) {
        MsgViewController * msg = [[MsgViewController alloc] init];
        msg.title = self.listData[indexPath.row];
        [self.navigationController pushViewController:msg animated:YES];
        
    }else if (indexPath.row == 1)
    {
        MethodExchangeVC * method = [[MethodExchangeVC alloc] init];
        method.title = self.listData[indexPath.row];
        [self.navigationController pushViewController:method animated:YES];
        
    }
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
