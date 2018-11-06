//
//  AppDelegate+JLRoutes.m
//  JLRoutesDemo
//
//  Created by chongdian on 2018/10/13.
//  Copyright © 2018年 chongdian. All rights reserved.
//

#import "AppDelegate+JLRoutes.h"
#import <JLRoutes/JLRoutes.h>
#import <objc/runtime.h>

@implementation AppDelegate (JLRoutes)

- (void)configJLRoutes
{
    [JLRoutes.globalRoutes addRoute:@"/push/:controller" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSLog(@"%@", parameters);
        UIViewController *vc = [NSClassFromString(parameters[@"controller"]) new];
        [self paramToVc:vc param:parameters];
        [[self currentViewController].navigationController pushViewController:vc animated:YES];
        return YES;
    }];
}

-(void)paramToVc:(UIViewController *) v param:(NSDictionary<NSString *,NSString *> *)parameters{
    unsigned int outCount = 0;
    objc_property_t * properties = class_copyPropertyList(v.class , &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        NSString *param = parameters[key];
        if (param != nil) {
            [v setValue:param forKey:key];
        }
    }
}

-(UIViewController *)currentViewController{
    
    UIViewController * currVC = nil;
    UIViewController * Rootvc = self.window.rootViewController ;
    do {
        if ([Rootvc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)Rootvc;
            UIViewController * v = [nav.viewControllers lastObject];
            currVC = v;
            Rootvc = v.presentedViewController;
            continue;
        }else if([Rootvc isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)Rootvc;
            currVC = tabVC;
            Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }
    } while (Rootvc!=nil);
    
    return currVC;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options
{
//    return [[JLRoutes routesForScheme:@"ViewController"]routeURL:url];
    return [JLRoutes routeURL:url];
}

@end
