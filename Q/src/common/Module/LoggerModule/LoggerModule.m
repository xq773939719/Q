//
//  LoggerModule.m
//  Q
//
//  Created by XQ on 2022/1/21.
//

#import "LoggerModule.h"

NSString *modueleName = @"LoggerModule";

@implementation LoggerModule

- (NSString *)moduleName {
  return modueleName;
}

- (BaseModuleLevel)moduleLevel {
  return BaseModuleLevelSystem;
}

- (void)didLoadModule {
  LoggerEngineDefaultCreate();
}

@end
