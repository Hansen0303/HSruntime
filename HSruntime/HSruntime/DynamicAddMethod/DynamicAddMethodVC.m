//
//  DynamicAddMethodVC.m
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "DynamicAddMethodVC.h"
#import "Cat.h"
#import "Dog.h"

#import "Bird.h"

@implementation DynamicAddMethodVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //如果一个类方法非常多，加载类到内存的时候也比较耗费资源，需要给每个方法生成映射表，可以使用动态给某个类，添加方法解决。
    //动态加载就是懒加载的机制  只能通过runtime动态的添加方法
    
    
    /**
     *  三种方法的选择
     
     Runtime提供三种方式来将原来的方法实现代替掉，那该怎样选择它们呢？
     
     Method Resolution：由于Method Resolution不能像消息转发那样可以交给其他对象来处理，所以只适用于在原来的类中代替掉。
     Fast Forwarding：它可以将消息处理转发给其他对象，使用范围更广，不只是限于原来的对象。
     Normal Forwarding：它跟Fast Forwarding一样可以消息转发，但它能通过NSInvocation对象获取更多消息发送的信息，例如：target、selector、arguments和返回值等信息。

     */

    [self normalForwarding];
    

    
}


- (void)methodResolution
{
    
    Cat * cat = [[Cat alloc] init];
    //一般用来动态添加方法
    [cat performSelector:@selector(eat) withObject:self];
    
}


- (void)fastForwarding
{
    Dog * dog = [[Dog alloc] init];
    
    [dog performSelector:@selector(eat) withObject:self];
    
}


- (void)normalForwarding
{
    Bird * brid = [[Bird alloc] init];
    
    [brid performSelector:@selector(eat) withObject:self];
    
    
}

@end
