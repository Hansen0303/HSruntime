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

#import "NSObject+Model.h"

#import "RuntimeStatusModel.h"

#import "RuntimeModel.h"

#import "NSObject+Model2.h"

@implementation DicModelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    
    //KVC字典转模型
//    [self text1];
    
    
    
    
    //runtime字典转模型(一级转换)
//    [self text2];
    
    
    
    NSLog(@"我就试测试一下啊啊啊啊");
    
    [self text3];
}


- (void)text1
{
    
    
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

- (void)text2
{
    
    NSString * bundleStr = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    
    //解析plist
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:bundleStr];
    
    NSArray * statusArray = dic[@"statuses"];
    
    NSMutableArray * listData = [NSMutableArray array];
    for (NSDictionary * dict in statusArray) {
        
//
        RuntimeStatusModel * status = [RuntimeStatusModel modelWithDict:dict];
//
        [listData addObject:status];
        
    }

    
    
    
}


- (void)text3
{
    
    NSString * bundleStr = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    
    //解析plist
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:bundleStr];
    
    NSArray * statusArray = dic[@"statuses"];
    
    NSMutableArray * listData = [NSMutableArray array];

//    // 设计模型属性代码
//    [NSObject creatPropertyCodeWithDict:statusArray[0][@"user"]];
    
    for (NSDictionary * dict in statusArray) {
        
        RuntimeModel * status = [RuntimeModel modelWithDict2:dict];

        [listData addObject:status];
        
    }
    
}




@end
