//
//  MethodExchangeVC.m
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "MethodExchangeVC.h"
#import "UIImage+Image.h"

@implementation MethodExchangeVC


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    //imageNamed加载图片 并不知道图片是否加载成功
    //以后调用imageNamed的时候 就知道图片是否加载
//    UIImage * image = [UIImage imageNamed:@""];

    
    //每次开发的时候都导入头文件
    //当一个项目开发太久,使用这个方法不靠谱
    [UIImage hs_imageNamed:@""];
    
    
    
    
    
}







@end
