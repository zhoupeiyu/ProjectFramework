//
//  JDLaunchAd.h
//  JDLaunchAdExample
//
//  Created by jdbr on 16/11/23.
//  Copyright © 2016年 jidibingren. All rights reserved.
//  代码地址:https://github.com/jidibingren/JDLaunchAd

//  特性:
//  1.支持全屏/半屏广告.
//  2.支持静态/动态广告.
//  3.兼容iPhone和iPad.
//  4.支持广告点击事件
//  5.自带图片下载,缓存功能.
//  6.支持设置未检测到广告数据,启动页停留时间
//  7.无依赖其他第三方框架.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIImageView+JDWebCache.h"
#import "JDSkipButton.h"

@class JDLaunchAd;

typedef void(^clickBlock)(NSUInteger);

typedef void(^setAdImageBlock)(JDLaunchAd*launchAd);

typedef void(^showFinishBlock)();

@interface JDLaunchAd : UIViewController

/**
 *  未检测到广告数据,启动页停留时间(默认3s)(最小1s)
 *  请在向服务器请求广告数据前,设置此属性
 */
@property (nonatomic, assign) NSInteger noDataDuration;

/**
 *  重置广告frame
 */
@property (nonatomic, assign) CGRect adFrame;

@property (nonatomic, strong) NSArray<NSString *>* imageUrls;

@property (nonatomic, assign) BOOL isShowCustomBtn;

@property (nonatomic, strong) UIButton *customBtn;

@property (nonatomic, strong) UIImage *placeholderImage;

@property (nonatomic, strong) UITapGestureRecognizer* adImageViewTap;

/**
 *  显示启动广告
 *
 *  @param frame      广告frame
 *  @param setAdImage 设置AdImage回调
 *  @param showFinish 广告显示完成回调
 */
+(void)showInWindow:(UIWindow *)window AdFrame:(CGRect)frame setAdImage:(setAdImageBlock)setAdImage showFinish:(showFinishBlock)showFinish;

+(void)showInViewController:(UIViewController *)vc AdFrame:(CGRect)frame setAdImage:(setAdImageBlock)setAdImage showFinish:(showFinishBlock)showFinish;

/**
 *  设置广告数据
 *
 *  @param imageUrl       图片url
 *  @param duration       广告停留时间(小于等于0s,默认按5s处理)
 *  @param skipType       跳过按钮类型
 *  @param options        图片缓存机制
 *  @param completedBlock 异步加载完图片回调
 *  @param click          广告点击事件回调
 */
-(void)setImageUrl:(NSString*)imageUrl duration:(NSInteger)duration skipType:(SkipType)skipType options:(JDWebImageOptions)options completed:(JDWebImageCompletionBlock)completedBlock click:(clickBlock)click;

-(void)setImageUrls:(NSArray*)imageUrls duration:(NSInteger)duration skipType:(SkipType)skipType options:(JDWebImageOptions)options completed:(JDWebImageCompletionBlock)completedBlock click:(clickBlock)click;

/**
 *  清除图片本地缓存
 */
+(void)clearDiskCache;

/**
 *  获取缓存图片占用总大小(M)
 */
+(float)imagesCacheSize;

@end

