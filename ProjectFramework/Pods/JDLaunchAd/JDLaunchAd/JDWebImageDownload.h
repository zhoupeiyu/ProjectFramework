//
//  JDWebImageDownload.h
//  JDLaunchAdExample
//
//  Created by jdbr on 16/11/23.
//  Copyright © 2016年 jidibingren. All rights reserved.
//  代码地址:https://github.com/jidibingren/JDLaunchAd

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, JDWebImageOptions) {
    
    /**
     *  有缓存,读取缓存,不重新加载,没缓存先加载,并缓存
     */
    JDWebImageDefault = 1 << 0,
    
    /**
     *  只加载,不缓存
     */
    JDWebImageOnlyLoad = 1 << 1,
    
    /**
     *  先读缓存,再加载刷新图片和缓存
     */
    JDWebImageRefreshCached = 1 << 2 ,
    
    /**
     *  后台缓存本次不显示,缓存OK后下次再显示
     */
    JDWebImageCacheInBackground = 1 << 3
    
};

typedef void(^JDWebImageCompletionBlock)(UIImage *image,NSURL *url);

@interface JDWebImageDownload : NSObject

/**
 *  异步下载图片
 *
 *  @param url            图片URL
 *  @param options        缓存机制
 *  @param completedBlock 下载完成回调
 */
+(void)jd_downLoadImage_asyncWithURL:(NSURL *)url options:(JDWebImageOptions)options completed:(JDWebImageCompletionBlock)completedBlock;


@end
