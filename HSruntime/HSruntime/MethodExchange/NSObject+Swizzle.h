//
//  NSObject+Swizzle.h
//  HSruntime
//
//  Created by hansen on 16/6/1.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)


+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector;


@end
