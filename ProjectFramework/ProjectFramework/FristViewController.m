//
//  FristViewController.m
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/11.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "FristViewController.h"

@interface FristViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation FristViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSString *text = [NSString positiveFormat:@"160000000"];
    _lbl.text = text;
    [_lbl sizeToFit];
    UIColor *color1 = [UIColor redColor];
    UIColor *color2 = [UIColor blueColor];
    UIColor *color = [UIColor colorWithGradientStyle:UIGradientStyleLeftToRight withFrame:_lbl.bounds andColors:@[color1,color2]];
    _lbl.textColor = color;
    
    NSMutableArray *familyNameArray = [[NSMutableArray alloc] init];
    NSArray* familyNamesAll = [UIFont familyNames];
    for (id family in familyNamesAll) {
        NSArray* fonts = [UIFont fontNamesForFamilyName:family];
        for (id font in fonts){
            [familyNameArray addObject:font];
        }
    }
    DLog(@"所有字体 %@",familyNameArray);
}
- (IBAction)Photo:(id)sender {
    
    [[PhotoManager sharedInstance] showPhotoPickForMaxCount:9 presentedViewController:self];
}
- (IBAction)Tip:(id)sender {
    
}


@end
