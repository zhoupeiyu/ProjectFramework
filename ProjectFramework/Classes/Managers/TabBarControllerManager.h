//
//  TabBarControllerManager.h
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/10.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CYLTabBarController.h>

@interface TabBarControllerManager : NSObject

#pragma mark - 配置
+ (UIColor *)baseViewColor;

+ (UIColor *)tabBarTitleNormalColor;
+ (UIColor *)tabBarTitleSelectedColor;


+ (UIColor *)navBarTitleColor;
+ (UIFont *)navBarTitleFont;

#pragma mark -tabBarController

+ (TabBarControllerManager *)sharedInstance;

+ (CYLTabBarController *)tabBarController;

@end
