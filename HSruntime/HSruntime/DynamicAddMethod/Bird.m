//
//  Bird.m
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "Bird.h"
#import "Dog.h"


@implementation Bird



#pragma mark - Method Resolution

+ (BOOL)resolveClassMethod:(SEL)sel
{
    
    return NO;
}



#pragma mark - Fast Forwarding
- (id)forwardingTargetForSelector:(SEL)aSelector
{

    return nil;
}



#pragma mark - Normal Forwarding

/**
 *  如果没有使用Fast Forwarding来消息转发，最后只有使用Normal Forwarding来进行消息转发。它首先调用methodSignatureForSelector:方法来获取函数的参数和返回值，如果返回为nil，程序会Crash掉，并抛出unrecognized selector sent to instance异常信息。如果返回一个函数签名，系统就会创建一个NSInvocation对象并调用-forwardInvocation:方法。

 */


// 指定方法签名，若返回nil，则不会进入下一步，而是无法处理消息
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSString * selStr = NSStringFromSelector(aSelector);
    
    if ([selStr isEqualToString:@"eat"]) {
        
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}


// 实现了此方法后，-doesNotRecognizeSelector:不会再被调用
- (void)forwardInvocation:(NSInvocation *)anInvocation
{

    // 1.我改变方法选择器 改变方法选择器后，还需要指定是哪个对象的方法

//    [anInvocation setSelector:@selector(fly)];
//    [anInvocation setTarget:self];
//    [anInvocation invoke];
    
    
    // 改变调用对象为dog
    [anInvocation invokeWithTarget:[[Dog alloc] init]];
    
}


- (void)fly
{
    
    NSLog(@"由eat改成fly  Normal Forwarding 小鸟飞~~");
    
}


@end
