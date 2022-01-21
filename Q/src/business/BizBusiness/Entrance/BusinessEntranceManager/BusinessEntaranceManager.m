//
//  BusinessEntaranceManager.m
//  Q
//
//  Created by XQ on 2022/1/21.
//

#import "BusinessEntaranceManager.h"

#import "TabBarController.h"

@implementation BusinessEntaranceManager

- (void)launchWithApplication:(BaseApplication *)application {
  [super launchWithApplication:application];
  TabBarController *tabBarController = [TabBarController share];
  
  application.window = [[BaseWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
  application.window.backgroundColor = UIColor.whiteColor;
  application.window.rootViewController = tabBarController;
  [application.window makeKeyAndVisible];
}

- (void)registerModules {
  [super registerModules];
  NSArray *businessModules = @[
    
  ];
  [BaseModuleManager registerModules:businessModules
                               level:BaseModuleLevelBusiness];
}


@end
