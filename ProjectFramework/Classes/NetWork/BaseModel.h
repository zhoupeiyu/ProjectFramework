//
//  BaseModel.h
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/11.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property (nonatomic, strong) NSNumber *error_code;
@property (nonatomic, strong) NSString *error_msg;

@end