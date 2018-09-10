//
//  JDWebImageDownload.m
//  JDLaunchAdExample
//
//  Created by jdbr on 16/11/23.
//  Copyright © 2016年 jidibingren. All rights reserved.
//  代码地址:https://github.com/jidibingren/JDLaunchAd

#import "JDWebImageDownload.h"
#import "JDImageCache.h"
#import "UIImage+JDGIF.h"

@implementation JDWebImageDownload

+(void)jd_downLoadImage_asyncWithURL:(NSURL *)url options:(JDWebImageOptions)options completed:(JDWebImageCompletionBlock)completedBlock
{
    if(!options) options = JDWebImageDefault;
    
    if (options&JDWebImageOnlyLoad) {
        
        [self jd_asyncDownLoadImageWithURL:url completed:completedBlock];
        
    } else if (options&JDWebImageRefreshCached) {
        
        UIImage *cacheImage = [JDImageCache jd_getCacheImageWithURL:url];
        
        if (cacheImage) {
            
            if(completedBlock) completedBlock(cacheImage,url);
            
        }
        
        [self jd_asyncDownLoadImageAndCacheWithURL:url completed:completedBlock];
        
    } else if (options&JDWebImageCacheInBackground) {
        
        UIImage *cacheImage = [JDImageCache jd_getCacheImageWithURL:url];
        
        if (cacheImage) {
            
            if(completedBlock) completedBlock(cacheImage,url);
            
        } else {
        
            [self jd_asyncDownLoadImageAndCacheWithURL:url completed:nil];
            
        }
        
    } else {
        
        UIImage *cacheImage = [JDImageCache jd_getCacheImageWithURL:url];
        
        if (cacheImage) {
           
            if(completedBlock) completedBlock(cacheImage,url);
            
        } else {
          
            [self jd_asyncDownLoadImageAndCacheWithURL:url completed:completedBlock];
            
        }
        
    }
    
}

+(void)jd_asyncDownLoadImageAndCacheWithURL:(NSURL *)url completed:(JDWebImageCompletionBlock)completedBlock
{
    if(url==nil) return;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        UIImage *image = [self jd_downLoadImageAndCacheWithURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(completedBlock) completedBlock(image,url);
            
        });
        
    });
}

+(void)jd_asyncDownLoadImageWithURL:(NSURL *)url completed:(JDWebImageCompletionBlock)completedBlock
{
    if(url==nil) return;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        UIImage *image = [self jd_downLoadImageWithURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(completedBlock)  completedBlock(image,url);
            
        });
        
    });
}

+(UIImage *)jd_downLoadImageWithURL:(NSURL *)url{
    
    if(url==nil) return nil;

    NSData *data = [NSData dataWithContentsOfURL:url];
    
    return [UIImage jd_animatedGIFWithData:data];
    
}

+(UIImage *)jd_downLoadImageAndCacheWithURL:(NSURL *)url
{
    if(url==nil) return nil;

    NSData *data = [NSData dataWithContentsOfURL:url];
    
    [JDImageCache jd_saveImageData:data imageURL:url];
    
    return [UIImage jd_animatedGIFWithData:data];
}

@end
