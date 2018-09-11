//
//  BaseNetWorkService.h
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/11.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetWorkService : NSObject

+ (BaseNetWorkService *)sharedInstance;

+ (BOOL)isReachable;

@end
