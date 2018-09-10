//
//  UIImageView+JDWebCache.m
//  JDLaunchAdExample
//
//  Created by jdbr on 16/11/23.
//  Copyright © 2016年 jidibingren. All rights reserved.
//  代码地址:https://github.com/jidibingren/JDLaunchAd

#import "UIImageView+JDWebCache.h"

@implementation UIImageView (JDWebCache)

- (void)jd_setImageWithURL:(NSURL *)url
{
    [self jd_setImageWithURL:url placeholderImage:nil];
}

- (void)jd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self jd_setImageWithURL:url placeholderImage:placeholder completed:nil];
}

- (void)jd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(JDWebImageCompletionBlock)completedBlock
{
    [self jd_setImageWithURL:url placeholderImage:placeholder options:JDWebImageDefault completed:completedBlock];
}

-(void)jd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(JDWebImageOptions)options completed:(JDWebImageCompletionBlock)completedBlock
{
    if(placeholder) self.image = placeholder;
    
    if (url) {
        __weak __typeof(self)wself = self;
        
        [JDWebImageDownload jd_downLoadImage_asyncWithURL:url options:options completed:^(UIImage *image, NSURL *url) {
            
            if(!wself) return;
            
            wself.image = image;
            
            if (image&&completedBlock) {
                completedBlock(image,url);
            }
        }];
    }
}

@end
