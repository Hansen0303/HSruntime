
//
//  NSObject+Swizzle.m
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "NSObject+Swizzle.h"

#import <objc/message.h>

@implementation NSObject (Swizzle)




/**
 *  选择器、方法与实现
 
 在Objective-C中，选择器(selector)、方法(method)和实现(implementation)是运行时中一个特殊点，虽然在一般情况下，这些术语更多的是用在消息发送的过程描述中。
 
 以下是Objective-C Runtime Reference中的对这几个术语一些描述：
 
 Selector(typedef struct objc_selector *SEL)：用于在运行时中表示一个方法的名称。一个方法选择器是一个C字符串，它是在Objective-C运行时被注册的。选择器由编译器生成，并且在类被加载时由运行时自动做映射操作。
 Method(typedef struct objc_method *Method)：在类定义中表示方法的类型
 Implementation(typedef id (*IMP)(id, SEL, …))：这是一个指针类型，指向方法实现函数的开始位置。这个函数使用为当前CPU架构实现的标准C调用规范。每一个参数是指向对象自身的指针(self)，第二个参数是方法选择器。然后是方法的实际参数。
 
 理解这几个术语之间的关系最好的方式是：一个类维护一个运行时可接收的消息分发表；分发表中的每个入口是一个方法(Method)，其中key是一个特定名称，即选择器(SEL)，其对应一个实现(IMP)，即指向底层C函数的指针。
 
 为了swizzle一个方法，我们可以在分发表中将一个方法的现有的选择器映射到不同的实现，而将该选择器对应的原始实现关联到一个新的选择器中。
 
 
 1.SEL是索引
 2.IMP是真正的函数
 3.既然我们SEL和IMP是映射关系，那么我们就可以改变这个映射关系，method swizzle，就是这个原理

 */




+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector
{
    
    
    Method originalMethod = class_getInstanceMethod([self class], originalSelector);
    Method swizzledMethod = class_getInstanceMethod([self class], swizzledSelector);
    
   
    /* * class_addMethod方法会给这个类添加一个方法 
        * 添加就是为了重写父类的方法
        * 如果这个类（本身，不包括父类）已经有了originalSelector，则无法添加成功，同时返回NO 
        * 所以这里的意义是：如果这个类（自身，不包括父类）没有originSelector，则给它添加一个方法，而方法实现对应于swizzledMethod
        * 如果originalSelector是父类中的方法，而子类也没有重写它，这时就不能直接交换两个方法的实现，而是要给子类也添加一个originalSelector的实现。
     */
    
    
    
    BOOL didAddMethod = class_addMethod([self class], originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        
        class_replaceMethod([self class], swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        
    }else
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
    
    
    
}








@end
