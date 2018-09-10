//
//  BaseNavigationViewController.m
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/10.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.translucent = NO;
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[BaseTheme navBarTitleColor],NSForegroundColorAttributeName,nil]];
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[BaseTheme navBarTitleFont],NSFontAttributeName,nil]];
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    UITabBarItem *tabBarItem = self.tabBarItem;
    UIColor *titleColor = [BaseTheme tabBarTitleNormalColor];
    UIColor *hlTitleColor = [BaseTheme tabBarTitleSelectedColor];
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:titleColor, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, nil]] forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:hlTitleColor, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, nil]] forState:UIControlStateSelected];
    
//    self.navigationBar.shadowImage = [UIImage imageWithColor:[UIColor redColor]];
    
}

@end
