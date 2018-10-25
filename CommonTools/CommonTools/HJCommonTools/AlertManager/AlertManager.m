//
//  AlertManager.m
//  VoucherCollection
//
//  Created by eassy on 2018/10/22.
//  Copyright © 2018年 eassy. All rights reserved.
//

#import "AlertManager.h"

@interface AlertManager()

@property (nonatomic ,strong) NSMutableArray *alertArray;

/**
 windows
 */
@property (nonatomic ,strong) UIWindow *alertWindow;

/**
 backView
 */
@property (nonatomic ,strong) UIView *backView;

@property (nonatomic ,strong) UIView *contentView;

@end

@implementation AlertManager

- (void)commonInit
{
    [self.alertWindow addSubview:self.backView];
    self.alertWindow.hidden = YES;
}

#pragma mark - public Method

- (void)addAlertView:(UIView *)subView priority:(AlertPriority)priority
{
    /// 组装成一个 model ，假如是最高级，隐藏其他的。
    AlertModel *model = [[AlertModel alloc] initWithView:subView priority:priority];
    
    if (self.alertArray.count) {
        /// 有正在显示的,高级别清空并隐藏,普通级别加入队列中
        if (priority == AlertPriorityNormal) {
            [self.alertArray addObject:model];
        }
        else if(priority == AlertPriorityHighest)
        {
            [self.alertArray removeAllObjects];
            [self.contentView removeFromSuperview];
            [self.alertArray addObject:model];
            [self showNext];
        }
    }
    else
    {
        /// 没有显示的
        [self.alertArray addObject:model];
        [self showNext];
    }
    
}

- (void)hideAlertView:(UIView *)subView
{
    /// 查找到这个 model ，隐藏掉，假如队列里面还有其他的，显示其他的。
    __block AlertModel *hideModel;
    [self.alertArray enumerateObjectsUsingBlock:^(AlertModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        if (model.view == subView) {
            *stop = YES;
            hideModel = model;
        }
    }];
    if (hideModel) {
        [subView removeFromSuperview];
        [self.alertArray removeObject:hideModel];
    }
    [self showNext];
}

- (void)showNext
{
    if (self.alertArray.count) {
        self.alertWindow.hidden = NO;
        AlertModel *model = self.alertArray.firstObject;
        [self.alertWindow addSubview:model.view];
        self.contentView = model.view;
    }
    else
    {
        self.alertWindow.hidden = YES;
    }
}

#pragma mark - getters setters

- (NSMutableArray *)alertArray
{
    if (!_alertArray) {
        _alertArray = [NSMutableArray new];
    }
    return _alertArray;
}

- (UIWindow *)alertWindow
{
    if (!_alertWindow) {
        _alertWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    }
    return _alertWindow;
}

- (UIView *)backView
{
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    }
    return _backView;
}

@end


@implementation AlertModel

- (instancetype)initWithView:(UIView *)view priority:(AlertPriority)priority
{
    if (self = [super init]) {
        self.view = view;
        self.priority = priority;
    }
    return self;
}

@end
