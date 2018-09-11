//
//  BaseNetWorkService.m
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/11.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "BaseNetWorkService.h"

@implementation BaseNetWorkService

SYNTHESIZE_SINGLETON_ARC(BaseNetWorkService);

+ (BOOL)isReachable {
   Reachability *reach = [Reachability reachabilityForInternetConnection];
    return [reach isReachable];
}
@end
