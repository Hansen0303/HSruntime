//
//  DicModelViewController.m
//  HSruntime
//
//  Created by hansen on 16/6/2.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "DicModelViewController.h"

#import "NSObject+Property.h"

#import "StatusModel.h"

@implementation DicModelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString * bundleStr = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    
    //解析plist
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:bundleStr];
    
    NSArray * statusArray = dic[@"statuses"];
    
    NSMutableArray * listData = [NSMutableArray array];
    for (NSDictionary * dict in statusArray) {
        
//        [NSDictionary creatPropertyCodeWithDict:dict];

        StatusModel * status = [StatusModel statusWithDict:dict];
        
        [listData addObject:status];
        
    }
    
        
    NSLog(@"%@",listData);
    
}











@end
