//
//  OtherViewController.m
//  JLRoutesDemo
//
//  Created by chongdian on 2018/10/12.
//  Copyright © 2018年 chongdian. All rights reserved.
//

#import "OtherViewController.h"
#import <JLRoutes.h>

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    NSLog(@"接收到的userId = %@", _userId);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    const char *address = [@"北京市朝阳区" UTF8String];
    const char *teacher = [@"刘老师" UTF8String];
    
    //方式一(get传参)
    NSString *urlString = [NSString stringWithFormat:@"JLRoutesDemo://push/ThirdViewController?age=25&address=%@&teacher=%@", [[NSString alloc] initWithUTF8String:address], [[NSString alloc] initWithUTF8String:teacher]];
    NSString*hString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];//需要将中文encode
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:hString]];
    
    //方式二(字典传参)
//    [[JLRoutes globalRoutes] routeURL:[NSURL URLWithString:@"JLRoutesDemo://push/ThirdViewController"] withParameters:@{@"age" : @"25", @"address" : @"北京市朝阳区", @"teacher" : @"刘老师"}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
