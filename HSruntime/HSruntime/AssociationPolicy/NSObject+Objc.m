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
    //key : 属性名 根据KEY获取关联的对象  void * == id
    //value: 关联的值
    //policy: 策略
    objc_setAssociatedObject(self, @"HSname", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (NSString *)name
{
    
    
    return objc_getAssociatedObject(self, @"HSname");
}


@end
