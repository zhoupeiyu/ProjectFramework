//
//  TabBarControllerManager.m
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/10.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "TabBarControllerManager.h"

@interface TabBarControllerManager ()

@property (nonatomic, strong) NSMutableArray *controllers;
@property (nonatomic, strong) NSMutableArray *tabBarItemsAttributes;


@end
@implementation TabBarControllerManager

SYNTHESIZE_SINGLETON_ARC(TabBarControllerManager);

+ (UIColor *)baseViewColor {
    return [UIColor colorFromRGB:0xf2f2f2];
}

+ (UIColor *)tabBarTitleNormalColor {
    return [UIColor colorFromRGB:0x888888];
}
+ (UIColor *)tabBarTitleSelectedColor {
    return [UIColor colorFromRGB:0x131313];
}


+ (UIColor *)navBarTitleColor {
    return [UIColor colorFromRGB:0x131313];
}
+ (UIFont *)navBarTitleFont {
    return [UIFont systemFontOfSize:18];
}

+ (BaseNavigationViewController *)setupTabBarItem:(BaseViewController *)baseVC {
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:baseVC];
    UITabBarItem *tabBarItem = nav.tabBarItem;
    UIColor *titleColor = [self tabBarTitleNormalColor];
    UIColor *hlTitleColor = [self tabBarTitleSelectedColor];
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:titleColor, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, nil]] forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:hlTitleColor, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, nil]] forState:UIControlStateSelected];
    return nav;
}
- (NSMutableArray *)controllers {
    if (!_controllers) {
        _controllers = [[NSMutableArray alloc] init];
        {
            BaseViewController *vc = [[BaseViewController alloc] init];
            BaseNavigationViewController *nav = [TabBarControllerManager setupTabBarItem:vc];
            [_controllers addObject:nav];
        }
        {
            BaseViewController *vc = [[BaseViewController alloc] init];
            BaseNavigationViewController *nav = [TabBarControllerManager setupTabBarItem:vc];
            [_controllers addObject:nav];
        }
        {
            BaseViewController *vc = [[BaseViewController alloc] init];
            BaseNavigationViewController *nav = [TabBarControllerManager setupTabBarItem:vc];
            [_controllers addObject:nav];
        }
    }
    return _controllers;
}

- (NSMutableArray *)tabBarItemsAttributes {
    if (!_tabBarItemsAttributes) {
        _tabBarItemsAttributes = [[NSMutableArray alloc] init];
        {
            NSMutableDictionary *infoDic = [TabBarControllerManager infoDicWithTitle:@"首页" normalImage:@"tab_home_24x24_" selectedImage:@"tab_home_h_24x24_"];
            [_tabBarItemsAttributes addObject:infoDic];
        }
        {
            NSMutableDictionary *infoDic = [TabBarControllerManager infoDicWithTitle:@"消息" normalImage:@"tab_msn_24x24_" selectedImage:@"tab_msn_h_24x24_"];
            [_tabBarItemsAttributes addObject:infoDic];
        }
        {
            NSMutableDictionary *infoDic = [TabBarControllerManager infoDicWithTitle:@"我的" normalImage:@"tab_me_24x24_" selectedImage:@"tab_me_h_24x24_"];
            [_tabBarItemsAttributes addObject:infoDic];
        }
    }
    
    return _tabBarItemsAttributes;
}
+ (NSMutableDictionary *)infoDicWithTitle:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:title forKey:CYLTabBarItemTitle];
    [dic setObject:[[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forKey:CYLTabBarItemImage];
    [dic setObject:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forKey:CYLTabBarItemSelectedImage];
    return dic;
}

+ (CYLTabBarController *)tabBarController {
    return [[self sharedInstance] tabBarController];
}
- (CYLTabBarController *)tabBarController {
    CYLTabBarController *tabBar = [[CYLTabBarController alloc] initWithViewControllers:self.controllers tabBarItemsAttributes:self.tabBarItemsAttributes];
    return tabBar;
}
@end
