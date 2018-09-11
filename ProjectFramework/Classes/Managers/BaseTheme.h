//
//  TabBarControllerManager.h
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/10.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CYLTabBarController.h>

@interface BaseTheme : NSObject

#pragma mark - 配置
+ (UIColor *)baseViewColor;

+ (UIColor *)tabBarTitleNormalColor;
+ (UIColor *)tabBarTitleSelectedColor;


+ (UIColor *)navBarTitleColor;
+ (UIFont *)navBarTitleFont;
+ (UIImage *)navBackgroundImage;
+ (UIColor *)navBarBottomLineColor;

#pragma mark -tabBarController

+ (BaseTheme *)sharedInstance;

+ (CYLTabBarController *)tabBarController;

@end
