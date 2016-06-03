//
//  RuntimeStatusModel.h
//  HSruntime
//
//  Created by hansen on 16/6/2.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeStatusModel : NSObject


@property (nonatomic,strong) NSString *source;

@property (nonatomic,assign)  int reposts_count;

@property (nonatomic,strong) NSArray *pic_urls;

@property (nonatomic,strong) NSString *created_at;

@property (nonatomic,assign)  int attitudes_count;

@property (nonatomic,strong) NSString *idstr;

@property (nonatomic,strong) NSString *text;

@property (nonatomic,assign)  int comments_count;

@property (nonatomic,strong) NSDictionary *user;


@property (nonatomic, strong) NSDictionary * retweeted_status;

@end
