//
//  BaseShareManager.m
//  VoucherCollection
//
//  Created by eassy on 2018/10/22.
//  Copyright © 2018年 eassy. All rights reserved.
//

#import "BaseShareManager.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation BaseShareManager

+ (instancetype)shareInstance
{
    static  BaseShareManager *manager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        manager = [[self alloc] init];
        SEL commonInit = NSSelectorFromString(@"commonInit");
        objc_msgSend(manager,commonInit);
        
//        [manager commonInit];
    });
    return manager;
}

- (void)commonInit
{
        
}

@end
