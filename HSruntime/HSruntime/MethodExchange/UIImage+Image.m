//
//  UIImage+Image.m
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "UIImage+Image.h"

#import <objc/message.h>

@implementation UIImage (Image)

//方案1

//在分类里面不能调用super 分类木有父类
//+ (UIImage *)imageNamed:(NSString *)name
//{
//    
////   [super ]
//    
//}





+ (__kindof UIImage*)hs_imageNamed:(NSString *)imageNamed
{
    //1. 加载图片
    UIImage * image = [UIImage hs_imageNamed:imageNamed];
    
    //2. 判断功能
    if (image == nil) {
        
        NSLog(@"这是个空");
        
    }

    
    return image;
}




//加载这个分类的时候调用
+ (void)load
{
    NSLog(@"%s",__func__);
    
    
    //class_getMethodImplementation 获取方法的实现
    //class_getInstanceMethod  获取对象方法
    //class_getClassMethod  获取类方法
    // IMP  方法实现
    
    
    //imageNamed
    //Class: 获取哪个类的方法
    //SEL : 获取方法编号 根据SEL就能去对应的类找方法
    Method imageNamed =  class_getClassMethod([UIImage class], @selector(imageNamed:));
    
    Method hs_imageNamed = class_getClassMethod([UIImage class], @selector(hs_imageNamed:));
    
    
    
    //交换方法的实现
    method_exchangeImplementations(imageNamed, hs_imageNamed);
    
    
}




@end
