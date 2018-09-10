//
//  JDImageCache.h
//  JDLaunchAdExample
//
//  Created by jdbr on 16/11/23.
//  Copyright © 2016年 jidibingren. All rights reserved.
//  代码地址:https://github.com/jidibingren/JDLaunchAd

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JDImageCache : NSObject

/**
 *  获取缓存图片
 *
 *  @param url 图片url
 *
 *  @return 图片
 */
+(UIImage *)jd_getCacheImageWithURL:(NSURL *)url;

/**
 *  缓存图片
 *
 *  @param data imageData
 *  @param url  图片url
 */
+(void)jd_saveImageData:(NSData *)data imageURL:(NSURL *)url;

/**
 *  获取缓存路径
 *
 *  @return path
 */
+(NSString *)jd_cacheImagePath;

/**
 *  check路径
 *
 *  @param path 路径
 */
+(void)jd_checkDirectory:(NSString *)path;
@end
