//
//  ViewController.m
//  JLRoutesDemo
//
//  Created by chongdian on 2018/10/12.
//  Copyright © 2018年 chongdian. All rights reserved.
//

#import "ViewController.h"
#import <JLRoutes/JLRoutes.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSString *url = @"JLRoutesDemo://push/OtherViewController?userId=1234";
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    [JLRoutes routeURL:[NSURL URLWithString:@"JLRoutesDemo://push/OtherViewController?userId=1234"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
