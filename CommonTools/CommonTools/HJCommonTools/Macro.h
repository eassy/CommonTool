//
//  Macro.h
//  YiFuBao
//
//  Created by Joven on 15/12/22.
//  Copyright © 2015年 Joven. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

/*
 *@bref  系统版本判断
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#define kScreenWidth        ([UIScreen mainScreen].bounds).size.width //应用程序的宽度
#define kScreenHeight       ([UIScreen mainScreen].bounds).size.height //应用程序的高度


// 字体的大小
#define HJNewFont(CGFloat) [UIFont systemFontOfSize:CGFloat];

#define kVersion                        [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]


#define kSingleLineWidth               (1 / [UIScreen mainScreen].scale)

// 状态栏高度
#define kStatusBarHeight  [UIApplication sharedApplication].statusBarFrame.size.height

/// 导航栏高度
#define kViewControllerHeadHeight       (kStatusBarHeight+44)

/// 底部tabBar高度
#define kTabBarHeight (kIsIphoneX ? (49.f+34.f) : 49.f)

#define QSWeakSelf(weakSelf)                         __weak __typeof(&*self)weakSelf = self;   //weakSelf

#endif /* Macro_h */

