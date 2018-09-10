//
//  PhotoManager.h
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/10.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoManager : NSObject

+ (PhotoManager *)sharedInstance;

- (void)showPhotoPickForMaxCount:(NSInteger)maxCount presentedViewController:(UIViewController *)presentedVC;

- (NSMutableArray *)selectedImages;

@end
