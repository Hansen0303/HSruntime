//
//  MsgViewController.m
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "MsgViewController.h"
#import "Person.h"
#import <objc/message.h>


//1.导入<objc/message.h>
//2.Build setting ->搜索msg ->NO


@interface MsgViewController ()

@end

@implementation MsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    //发送消息
    
    Person * person = [[Person alloc] init];
    
    //    [person run];
    
    //OC运行时机制, 消息机制是运行时机制最重要的机制
    //消息机制: 任何方法的调用 本质都是发送消息
    
    //SEL方法编号 , 根据方法编号就可以找到对应的方法实现
    //    [person performSelector:@selector(run) withObject:self];
    
    //运行时 ,发送消息  谁做事情就拿谁
    //xcode5之后 苹果不建议使用底层方法
    //xcode5之后 使用运行时
    
    //让person发送一个消息
    objc_msgSend(person, @selector(run));
    objc_msgSend(person, @selector(run:),10);
    
    
    
    //类名调用类方法  本质是类名转换为类对象
    [Person run];
    //获取类对象
    Class personclass = [Person class];
    
    [personclass performSelector:@selector(run) withObject:self];
    
    objc_msgSend(personclass, @selector(run));
    



}













@end
