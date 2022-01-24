//
//  BusinessEntranceManager.m
//  Q
//
//  Created by XQ on 2022/1/21.
//

#import "BusinessEntranceManager.h"

#import "TabBarController.h"
#import "BusinessLaunchViewController.h"

@interface BusinessEntranceManager () <LaunchViewControllerProtocol>

@end

@implementation BusinessEntranceManager

- (void)launchWithApplication:(UIApplication *)application {
  [super launchWithApplication:application];
  BusinessLaunchViewController *launchViewController = [BusinessLaunchViewController new];
  launchViewController.delegate = self;
  application.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
  application.window.rootViewController = launchViewController;
  application.window.backgroundColor = UIColor.whiteColor;
  [application.window makeKeyAndVisible];

}

- (UIViewController *)rootViewController {
  TabBarController *tabBarController = [TabBarController share];
  return tabBarController;
}

- (NSArray<Class> *)businessModules {
  return @[];
}

#pragma mark - BaseEntranceModuleProtocal
- (void)showRootViewController {
  UIApplication *application = [UIApplication sharedApplication];
  application.window.rootViewController = self.rootNavigationController;
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
