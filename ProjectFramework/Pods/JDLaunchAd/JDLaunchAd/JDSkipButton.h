//
//  JDSkipButton.h
//  JDLaunchAdExample
//
//  Created by jdbr on 2016/11/9.
//  Copyright © 2016年 jidibingren. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  倒计时类型
 */
typedef NS_ENUM(NSInteger,SkipType) {
    
    SkipTypeNone      = 1,//无
    SkipTypeTime      = 2,//倒计时
    SkipTypeText      = 3,//跳过
    SkipTypeTimeText  = 4,//倒计时+跳过
    
};

@interface JDSkipButton : UIButton

@property(nonatomic,strong)UILabel *timeLab;

@property(nonatomic,assign)CGFloat leftRightSpace;

@property(nonatomic,assign)CGFloat topBottomSpace;

/**
 *  设置skipButton 状态
 */
-(void)jd_stateWithskipType:(SkipType )skipType andDuration:(NSInteger)duration;

@end
