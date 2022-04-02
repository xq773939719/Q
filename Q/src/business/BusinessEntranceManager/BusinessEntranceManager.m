//
//  BusinessEntranceManager.m
//
//  Created by XQ on 2022/1/21.
//

#import "BusinessEntranceManager.h"

#import "TabBarController.h"
#import "BusinessLaunchViewController.h"
#import "BusinessRouteManager.h"

@interface BusinessEntranceManager () <LaunchViewControllerProtocol>

@end

@implementation BusinessEntranceManager

- (void)launchWithApplication:(UIApplication *)application {
    [super launchWithApplication:application];
    BusinessLaunchViewController *launchViewController = [BusinessLaunchViewController new];
    launchViewController.delegate = self;
    self.window.rootViewController = launchViewController;
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
}

- (UIViewController *)rootViewController {
    TabBarController *tabBarController = [TabBarController share];
    return tabBarController;
}

- (RouteManager *)routeManager {
    return [BusinessRouteManager new];
}

- (NSArray<Class> *)businessModules {
    return @[];
}

- (void)registerViewControllers {
    [self.routeManager registerViewControllers];
}

#pragma mark - LaunchViewControllerProtocol
- (void)showRootViewController {
    self.window.rootViewController = self.rootNavigationController;
    [self configTheme];
}

#pragma mark - private method
// 全局配置
- (void)configTheme {
    [UITabBar appearance].tintColor = [UIColor colorNamed:@"TintColor"];
    [UITabBar appearance].backgroundColor = [UIColor colorNamed:@"ForegroundColor"];
    
    // 导航栏背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor clearColor]];
    // 导航栏返回按钮、自定义UIBarButtonItem颜色
    [[UINavigationBar appearance] setTintColor:[UIColor colorNamed:@"TintColor"]];
    
}

@end
