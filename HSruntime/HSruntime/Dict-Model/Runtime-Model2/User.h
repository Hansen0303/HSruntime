//
//  User.h
//  HSruntime
//
//  Created by hansen on 16/6/2.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject



@property (nonatomic,strong) NSString *profile_image_url;

@property (nonatomic,assign) BOOL vip;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,assign)  int mbrank;

@property (nonatomic,assign)  int mbtype;



@end
