//
//  BaseModule.m
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "BaseModule.h"

@interface BaseModule ()

@property (nonatomic, strong) NSDictionary *config;

@end

@implementation BaseModule

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.config = [NSDictionary dictionary];
  }
  return self;
}

- (instancetype)initWithConfig: (NSDictionary *)config {
  self = [self init];
  if (self) {
    self.config = [config copy];
  }
  return self;
}

# pragma mark - BaseModule protocol
- (NSString *)moduleName {
  return nil;
}

- (BaseModuleLevel)moduleLevel {
  return BaseModuleLevelUnknown;
}

- (void)initModule {
  return;
}

- (nonnull NSDictionary *)moduleConfig {
  return self.config;
}


@end
