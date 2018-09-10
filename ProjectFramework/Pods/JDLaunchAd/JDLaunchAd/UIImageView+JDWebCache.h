//
//  UIImageView+JDWebCache.h
//  JDLaunchAdExample
//
//  Created by jdbr on 16/11/23.
//  Copyright © 2016年 jidibingren. All rights reserved.
//  代码地址:https://github.com/jidibingren/JDLaunchAd

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JDWebImageDownload.h"


@interface UIImageView (JDWebCache)

/**
 *  异步加载网络图片带本地缓存
 *
 *  @param url 图片url
 */
- (void)jd_setImageWithURL:(NSURL *)url;

/**
 *  异步加载网络图片/带本地缓存
 *
 *  @param url         图片url
 *  @param placeholder 默认图片
 */
- (void)jd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

/**
 *  异步加载网络图片/带本地缓存
 *
 *  @param url            图片url
 *  @param placeholder    默认图片
 *  @param completedBlock 加载完成回调
 */
- (void)jd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(JDWebImageCompletionBlock)completedBlock;

/**
 *  异步加载网络图片/带本地缓存
 *
 *  @param url            图片url
 *  @param placeholder    默认图片
 *  @param options        缓存机制
 *  @param completedBlock 加载完成回调
 */
-(void)jd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(JDWebImageOptions)options completed:(JDWebImageCompletionBlock)completedBlock;

@end
