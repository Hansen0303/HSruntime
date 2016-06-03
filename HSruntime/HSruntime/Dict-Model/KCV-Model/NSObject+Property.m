//
//  NSObject+Property.m
//  HSruntime
//
//  Created by hansen on 16/6/2.
//  Copyright © 2016年 hansen. All rights reserved.
//  通过解析字典自动生成属性代码

#import "NSObject+Property.h"

@implementation NSObject (Property)


+ (void)creatPropertyCodeWithDict:(NSDictionary *)dict
{
    
    NSMutableString * strM = [NSMutableString string];
    //遍历字典
    __block NSString * code;

    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        

//        NSLog(@"%@  %@",propertyName, [value class]);
        
        if ([value isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSString *%@;", propertyName];
            
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")])
        {
            code = [NSString stringWithFormat:@"@property (nonatomic,assign)  int %@;", propertyName];

        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")])
        {
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSArray *%@;", propertyName];
            
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")])
        {
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSDictionary *%@;", propertyName];

        }
        else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")])
        {
            code = [NSString stringWithFormat:@"@property (nonatomic,assign) BOOL %@;", propertyName];

            
        }
        [strM appendFormat:@"\n%@\n",code];

    }];
    
//    //属性代码
//    NSString * code;
//    //属性策略
//    NSString * polity;
//    //属性类型
//    NSString * type;
//    //属性名
//    NSString * propertyName;
    
    
//    code = [NSString stringWithFormat:@"@property (nonatomic,%@) %@ %@",polity, type, propertyName];
    
    
    
    NSLog(@"======%@",strM);
    
//    return code;
    
}







@end
