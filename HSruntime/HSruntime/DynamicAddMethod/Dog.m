//
//  Dog.m
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "Dog.h"

@implementation Dog


#pragma mark - Method Resolution

+ (BOOL)resolveClassMethod:(SEL)sel
{
    
    return NO;
}



//如果resolveInstanceMethod方法返回NO，运行时就跳转到下一步：消息转发(Message Forwarding) 用于指定备选响应此SEL的对象
// 千万不能返回self，否则就会死循环
// 自己没有实现这个方法才会进入这一流程，因此成为死循环
//如果目标对象实现- forwardingTargetForSelector:方法，系统就会在运行时调用这个方法，只要这个方法返回的不是nil或self，也会重启消息发送的过程，把这消息转发给其他对象来处理。否则，就会继续Normal Fowarding。

#pragma mark - Fast Forwarding
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if (aSelector == @selector(eat)) {
        return [Dog new];
    }
    
    return nil;
}


- (void)eat
{
    
    NSLog(@"fast forwarding");
    
}



@end
