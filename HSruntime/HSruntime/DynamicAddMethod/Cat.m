//
//  Cat.m
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "Cat.h"

#import <objc/message.h>

@implementation Cat

//Method Resolution


//动态添加方法 首先要实现这个+ resolveInstanceMethod:或+ resolveClassMethod:
//resolveInstanceMethod调用 : 当一个方法没有实现的时候 会先调用此方法 让你添加方法的实现。如果你添加方法并返回YES，那系统在运行时就会重新启动一次消息发送的过程。


+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    //这里我们没有给cat声明有eat方法 所以可以动态的添加eat方法
    
   NSString * selStr = NSStringFromSelector(sel);
    
    if ([selStr isEqualToString:@"eat"]) {
        
        /**
         cls:   给哪个类添加方法
         SEL:   添加方法的方法编号是什么  方法的名称 (也可以叫索引)
         IMP:   指针类型，指向方法实现函数的开始位置 (函数指针 函数入口)
         types: 方法类型
         */
        
        class_addMethod([self class], sel, (IMP)eat, "v@:");
        return YES;
        
    }
    
    return [super resolveInstanceMethod:sel];
    
}





//定义函数

//默认一个方法都有都有连个参数  self  _cmd  隐氏参数
//self: 方法调用者
//_cmd: 调用方法的编号

// v void
// @ 对象
// : 方法编号
//参考: https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100-SW1



void eat()
{
    
    NSLog(@"cat调用eat");
    
    
}



@end
