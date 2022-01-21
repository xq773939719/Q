//
//  BizEntaranceManager.m
//  Q
//
//  Created by XQ on 2022/1/21.
//

#import "BizEntranceManager.h"

#import "TabBarController.h"

@implementation BizEntranceManager

- (void)launchWithApplication:(UIApplication *)application {
  [super launchWithApplication:application];
  TabBarController *tabBarController = [TabBarController share];
  application.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
  application.window.backgroundColor = UIColor.whiteColor;
  application.window.rootViewController = tabBarController;
  [application.window makeKeyAndVisible];
}

- (NSArray<Class> *)businessModules {
  return @[];
}

@end
