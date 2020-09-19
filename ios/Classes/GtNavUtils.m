//
//  GtNavUtils.m
//  gt_verify
//
//  Created by edz on 2020/9/16.
//

#import "GtNavUtils.h"
#import <UIKit/UIKit.h>
@implementation GtNavUtils

+ (UIViewController *)currentVC{
    
    UIViewController * root = [UIApplication sharedApplication].keyWindow.rootViewController;

    if ([root isKindOfClass:[UITabBarController class]]) {
        root = [(UITabBarController *)root selectedViewController];
    }
    if ([root isKindOfClass:[UINavigationController class]]) {
        root = [(UINavigationController *)root topViewController];
    }
    return root;
}
@end
