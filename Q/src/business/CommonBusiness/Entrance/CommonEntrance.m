//
//  CommonEntrance.m
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "CommonEntrance.h"

#import <UIKit/UIKit.h>

#import "BaseScene.h"
#import "BaseApplicationDelegate.h"
#import "BaseWindowSceneDelegate.h"
#import "TabBarController.h"

@implementation CommonEntrance

+ (void)launchWithApplicationDelegate:(BaseApplicationDelegate *)delegate {
  TabBarController *tabBarController = [TabBarController share];
  delegate.window = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
  delegate.window.backgroundColor = UIColor.whiteColor;
  delegate.window.rootViewController = tabBarController;
  [delegate.window makeKeyAndVisible];
}

+ (void)launchWithWindowSceneDelegate:(BaseWindowSceneDelegate *)delegate withScene:(BaseScene *)scene {
  UIWindowScene *windowScene = (UIWindowScene *)scene;
  TabBarController *tabBarController = [TabBarController share];
  delegate.window = [[UIWindow alloc] initWithWindowScene:windowScene];
  delegate.window.frame = UIScreen.mainScreen.bounds;
  delegate.window.backgroundColor = UIColor.whiteColor;
  delegate.window.rootViewController = tabBarController;
  [delegate.window makeKeyAndVisible];
}

@end
