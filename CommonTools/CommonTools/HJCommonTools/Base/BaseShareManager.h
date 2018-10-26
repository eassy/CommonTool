//
//  BaseShareManager.h
//  VoucherCollection
//
//  Created by eassy on 2018/10/22.
//  Copyright © 2018年 eassy. All rights reserved.
//  简单的 shareManager ，作为单例父类，省去每次写 shareInstance 的方法。

#import <Foundation/Foundation.h>

@interface BaseShareManager : NSObject

+ (instancetype)shareInstance;

@end
