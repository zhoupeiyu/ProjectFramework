//
//  ViewController.m
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/10.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)Photo:(id)sender {
    [[PhotoManager sharedInstance] showPhotoPickForMaxCount:9 presentedViewController:self];
}

@end
