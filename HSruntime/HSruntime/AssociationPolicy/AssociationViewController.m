//
//  AssociationViewController.m
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "AssociationViewController.h"

#import "NSObject+Objc.h"

@implementation AssociationViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    NSObject * obj = [[NSObject alloc] init];
    obj.name = @"123";
    
    NSLog(@"%@",obj.name);
    
    
    
}



@end
