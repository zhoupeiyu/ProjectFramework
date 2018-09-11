//
//  FristViewController.m
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/11.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "FristViewController.h"

@interface FristViewController ()

@end

@implementation FristViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (IBAction)Photo:(id)sender {
    
    [[PhotoManager sharedInstance] showPhotoPickForMaxCount:9 presentedViewController:self];
}
- (IBAction)Tip:(id)sender {
    [TipViewManager showToastMessage:@"反馈成功"];
}


@end
