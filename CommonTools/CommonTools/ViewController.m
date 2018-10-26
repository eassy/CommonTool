//
//  ViewController.m
//  CommonTools
//
//  Created by eassy on 2018/10/26.
//  Copyright © 2018年 eassy. All rights reserved.
//

#import "ViewController.h"
#import "AlertManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[AlertManager shareInstance] addAlertView:[self testViewWithStr:@"1"] priority:AlertPriorityNormal];
    });
}

- (void)tapHandler
{
//    [[AlertManager shareInstance] hideAlertView:view];[[AlertManager shareInstance] hideAlertView:view];
}

- (UIView *)testViewWithStr:(NSString *)str
{
    UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(20, 90, kScreenWidth - 40, kScreenHeight - 180)];
    view.backgroundColor = [UIColor whiteColor];
    view.text = str;
    view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler) ];
    
    [view addGestureRecognizer:tap];
    return view;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
