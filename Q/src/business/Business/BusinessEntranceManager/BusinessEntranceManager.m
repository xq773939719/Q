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

- (NSArray<Class> *)businessModules {
  return @[];
}

- (void)showRootViewController {
  TabBarController *tabBarController = [TabBarController share];
  UIApplication *application = [UIApplication sharedApplication];
  application.window.rootViewController = tabBarController;
}

@end
