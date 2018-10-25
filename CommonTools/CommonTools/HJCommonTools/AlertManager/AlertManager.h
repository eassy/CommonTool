//
//  AlertManager.h
//  VoucherCollection
//
//  Created by eassy on 2018/10/22.
//  Copyright © 2018年 eassy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Macro.h"
#import "BaseShareManager.h"


typedef NS_ENUM(NSUInteger ,AlertPriority)
{
    /// 普通级别，顺序出现
    AlertPriorityNormal,
    /// 高级，挤掉其他的，截断顺序表
    AlertPriorityHighest
};


@interface AlertManager : BaseShareManager

- (void)addAlertView:(UIView *)subView priority:(AlertPriority)priority;

- (void)hideAlertView:(UIView *)subView;

@end

@interface AlertModel : NSObject

@property (nonatomic ,strong) UIView *view;

/**
 优先级 权重
 */
@property (nonatomic ,assign) AlertPriority priority;

- (instancetype)initWithView:(UIView *)view priority:(AlertPriority)priority;

@end
