//
//  NSObject+Model2.m
//  HSruntime
//
//  Created by hansen on 16/6/2.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "NSObject+Model2.h"
#import <objc/message.h>

@implementation NSObject (Model2)



+ (instancetype )modelWithDict2:(NSDictionary * )dict
{
    
    
    id objc = [[NSObject alloc] init];
    
    unsigned int count = 0;
    Ivar * ivarList =  class_copyIvarList(self, &count);
    
    for (int i = 0; i < count; i ++) {
        
        Ivar ivar = ivarList[i];
        
        //成员属性名称
        NSString * propertyName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        //成员属性的类型
        NSString *  propertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];

        
        //成员属性的名称开头带下划线的  所以要截取
        NSString * key = [propertyName substringFromIndex:1];

        
        id value = dict[key];
        

        NSLog(@"%@======%@",key,value);
        
        
        
        
        //    User:
        //    值是字典 成员属性的类型不是字典 才需要转换成字典
        //    并不是每个字典都要转
        if ([value isKindOfClass:[NSDictionary class]] &&  ![propertyType containsString:@"NS"]) {
            //需要继续把字典转换成模型   转换成哪个类型
            
            //获取需要转换的类对象
            
//            @"@\"User\""  User
            NSRange range = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringFromIndex:range.length + range.location];
            
            
//            User\""
            range = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringToIndex:range.location];
            
            
            // 根据字符串类名生成类对象
            Class modelClass =  NSClassFromString(propertyType);
            NSLog(@"%@",modelClass);
            
            
            if (modelClass) {
                value =  [modelClass modelWithDict2:dict];

            }
            
            
            
        }
        
        
        NSLog(@"===================%@%@",value,key);
        
        
        
        
        if (value) {
            [objc setValue:value forKey:key];
        }

    }
    
    
    return objc;
    
}



- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
    
}




@end
