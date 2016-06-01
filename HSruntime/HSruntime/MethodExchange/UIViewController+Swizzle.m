//
//  UIViewController+Swizzle.m
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "UIViewController+Swizzle.h"
#import "NSObject+Swizzle.h"


@implementation UIViewController (Swizzle)


/**
 *  Swizzling应该总是在+load中执行
 
在Objective-C中，运行时会自动调用每个类的两个方法。+load会在类初始加载时调用，+initialize会在第一次调用类的类方法或实例方法之前被调用。这两个方法是可选的，且只有在实现了它们时才会被调用。由于method swizzling会影响到类的全局状态，因此要尽量避免在并发处理中出现竞争的情况。+load能保证在类的初始化过程中被加载，并保证这种改变应用级别的行为的一致性。相比之下，+initialize在其执行时不提供这种保证—事实上，如果在应用中没为给这个类发送消息，则它可能永远不会被调用。
 */




/**
 *  Swizzling应该总是在dispatch_once中执行
 
 与上面相同，因为swizzling会改变全局状态，所以我们需要在运行时采取一些预防措施。原子性就是这样一种措施，它确保代码只被执行一次，不管有多少个线程。GCD的dispatch_once可以确保这种行为，我们应该将其作为method swizzling的最佳实践。
 
 swizzle写在initialize中当遇到并发情况时，程序仍然有可能诡异的crash掉，所以要加dispatch_once。
 */



+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzleSelector:@selector(viewWillAppear:) withSwizzledSelector:@selector(hs_viewWillApper:)];
        
    
    });
    
    
    
}



- (void)hs_viewWillApper:(BOOL)animated
{
    [self hs_viewWillApper:YES];
    
    NSLog(@"交换");
    
}



@end
