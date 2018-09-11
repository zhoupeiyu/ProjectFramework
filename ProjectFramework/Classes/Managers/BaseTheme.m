//
//  TabBarControllerManager.m
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/10.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "BaseTheme.h"

@interface BaseTheme ()

@property (nonatomic, strong) NSMutableArray *controllers;
@property (nonatomic, strong) NSMutableArray *tabBarItemsAttributes;


@end
@implementation BaseTheme

SYNTHESIZE_SINGLETON_ARC(BaseTheme);

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
+ (UIImage *)navBackgroundImage {
    UIImage *image = [UIImage imageNamed:@"navi_shadow_1x6_"];
    return image;
}
+ (UIColor *)navBarBottomLineColor {
    return [UIColor colorFromRGB:0xdfdfdf];
}
+ (UIColor *)navBarLeftTextColor {
    return [UIColor colorFromRGB:0x888888];
}
+ (UIColor *)navBarRightTextColor {
    return [UIColor colorFromRGB:0x888888];
}
+ (UIFont *)navBarLeftTextFont {
    return [UIFont systemFontOfSize:15];
}
+ (UIFont *)navBarRightTextFont {
    return [UIFont systemFontOfSize:15];
}
+ (UIColor *)navBarLeftHTextColor {
    return [UIColor colorWithHex:0x888888 alpha:0.4];
}
+ (UIColor *)navBarRightHTextColor {
    return [UIColor colorWithHex:0x888888 alpha:0.4];
}
- (NSMutableArray *)controllers {
    if (!_controllers) {
        _controllers = [[NSMutableArray alloc] init];
        {
            FristViewController *vc = [[FristViewController alloc] init];
            BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
            [_controllers addObject:nav];
        }
        {
            SecondViewController *vc = [[SecondViewController alloc] init];
            BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
            [_controllers addObject:nav];
        }
        {
            ThirdViewController *vc = [[ThirdViewController alloc] init];
            BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
            [_controllers addObject:nav];
        }
    }
    return _controllers;
}

- (NSMutableArray *)tabBarItemsAttributes {
    if (!_tabBarItemsAttributes) {
        _tabBarItemsAttributes = [[NSMutableArray alloc] init];
        {
            NSMutableDictionary *infoDic = [BaseTheme infoDicWithTitle:@"首页" normalImage:@"tab_home_24x24_" selectedImage:@"tab_home_h_24x24_"];
            [_tabBarItemsAttributes addObject:infoDic];
        }
        {
            NSMutableDictionary *infoDic = [BaseTheme infoDicWithTitle:@"消息" normalImage:@"tab_msn_24x24_" selectedImage:@"tab_msn_h_24x24_"];
            [_tabBarItemsAttributes addObject:infoDic];
        }
        {
            NSMutableDictionary *infoDic = [BaseTheme infoDicWithTitle:@"我的" normalImage:@"tab_me_24x24_" selectedImage:@"tab_me_h_24x24_"];
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
    UIImage *backImage = [UIImage imageNamed:@"tabbar_background"];
    backImage = [backImage stretchableImageWithLeftCapWidth:backImage.size.width * 0.5 topCapHeight:backImage.size.height * 0.5];
    [tabBar.tabBar setBackgroundImage:backImage];
    return tabBar;
}

@end
