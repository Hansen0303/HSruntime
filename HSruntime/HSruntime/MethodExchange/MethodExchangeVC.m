//
//  MethodExchangeVC.m
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "MethodExchangeVC.h"
#import "UIImage+Image.h"

#import "UIViewController+Swizzle.h"

@implementation MethodExchangeVC



/**
 
 *  Method Swizzling  方法交换
 *  Method Swizzling是改变一个selector的实际实现的技术
 *  我们可以在运行时通过修改类的分发表中selector对应的函数，来修改方法的实现。
  
 *  例如，
    1    我们想跟踪在程序中每一个view controller展示给用户的次数：当然，我们可以在每个view controller的viewDidAppear中添加跟踪代码；但是这太过麻烦，需要在每个view controller中写重复的代码。创建一个子类可能是一种实现方式，但需要同时创建UIViewController, UITableViewController, UINavigationController及其它UIKit中view controller的子类，这同样会产生许多重复的代码。
 
    2   imageNamed加载图片 并不知道图片是否加载成功 如果想在加载成功的时候同时也有成功信息  一个一个方法添加太麻烦  尤其是成熟的项目  那么就可以使用方法交换 以后调用imageNamed的时候 就知道图片是否加载
 */







- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    

}






@end
