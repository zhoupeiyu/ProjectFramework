//
//  SecondViewController.m
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/11.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.ly_emptyView = [TipViewManager netWorkErrorView:^{
        LLog(@"无网");
    }];
    
    [self.view ly_showEmptyView];
}

@end
