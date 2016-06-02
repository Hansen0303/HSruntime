//
//  StatusModel.m
//  HSruntime
//
//  Created by hansen on 16/6/2.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "StatusModel.h"

@implementation StatusModel


+ (StatusModel *)statusWithDict:(NSDictionary *)dict
{
    StatusModel * status = [[self alloc] init];
    
    //KVC
    [status setValuesForKeysWithDictionary:dict];
    
    return status;
}


//解决KVC报错
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //key : 没有找到的key
    //value: 没有找到key对应的值
    
    NSLog(@"%@%@",key,value);
    
    
    if ([key isEqualToString:@"id"]) {
        
        
    }
    
    
}


@end
