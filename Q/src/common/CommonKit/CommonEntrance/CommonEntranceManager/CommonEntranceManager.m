  //
  //  CommonEntrance.m
  //  Q
  //
  //  Created by XQ on 2022/1/20.
  //

#import "CommonEntranceManager.h"

#import "LoggerModule.h"
#import "PlayerModule.h"

@implementation CommonEntranceManager

- (void)launchWithApplication:(BaseApplication *)application {
  [super launchWithApplication:application];
}

- (void)registerModules {
  [super registerModules];
  NSArray *commonModules = @[
    [LoggerModule class],
    [PlayerModule class],
  ];
  [BaseModuleManager registerModules:commonModules
                               level:BaseModuleLevelCommon];
}

@end
