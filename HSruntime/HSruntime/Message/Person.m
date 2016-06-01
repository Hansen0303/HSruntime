//
//  Person.m
//  HSruntime
//
//  Created by hansen on 16/5/31.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void)run
{
    
    NSLog(@"对象调方法----------------");
    
}


+ (void)run
{
    
    NSLog(@"类调方法================");
}


- (void)run:(int)rice
{
    
    NSLog(@"%d",rice);
    
}



@end
