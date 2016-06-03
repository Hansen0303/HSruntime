//
//  NSObject+Model.m
//  HSruntime
//
//  Created by hansen on 16/6/2.
//  Copyright © 2016年 hansen. All rights reserved.
//  字典转模型

#import "NSObject+Model.h"

#import <objc/message.h>

@implementation NSObject (Model)


+ (instancetype )modelWithDict:(NSDictionary * )dict
{
    //创建对应类的
   id objc = [[self alloc] init];
    
    
    //遍历runtime中所有属性名 去字典中查找
    //属性定义在哪 定义在类 类里面有个属性列表(数组)
    
    
    //遍历模型所有属性名
    //IVR      :成员属性 _property
    //Property :属性
    //Ivar *   :指向ivar数组的指针  默认指向数组第0个
    
    //class    :获取哪个类的成员属性列表
    //count    :成员属性的总数
    unsigned int count = 0 ;
    Ivar * ivarList = class_copyIvarList(self, &count);
    
    
        
    for (int i = 0; i < count; i ++) {
        
        //获取成员属性
        Ivar ivar = ivarList[i];
        
        
        //获取成员名
//        ivar_getName(ivar);
        
         NSString * propertyName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        //获取成员类型
//        ivar_getTypeEncoding(ivar);
        
        NSString * pripertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        
        //获取字典的key
        //截取成员属性  去掉下划线
        NSString * key = [propertyName substringFromIndex:1];
        
        
        //获取字典的value
        id value = dict[key];
        
        
        //value  :字典的值
        //key    :属性名
        
        
        //KVC赋值不能传空
        if (value) {
            [objc setValue:value forKey:key];

        }
        
        
        
    }
    
    return objc;
    
}



@end
