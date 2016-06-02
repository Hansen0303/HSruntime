//
//  NSObject+Objc.m
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "NSObject+Objc.h"

#import <objc/message.h>

@implementation NSObject (Objc)


- (void)setName:(NSString *)name
{
    //添加属性,跟对象
    //和某个对象产生关联 添加属性
    //Object : 给哪个对象添加属性
    //key : 属性名 根据KEY获取关联的对象
    //value: 关联的值
    //policy
//    objc_setAssociatedObject(<#id object#>, <#const void *key#>, <#id value#>, <#objc_AssociationPolicy policy#>)
    
}

- (NSString *)name
{
    
    
    return @"";
}


@end
