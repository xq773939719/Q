//
//  BaseModuleManager.m
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "BaseModuleManager.h"
#import "BaseModule.h"

@interface BaseModuleManager ()

@property(nonatomic, copy) NSDictionary *configs;

@property(nonatomic, strong) NSMutableArray *moduleArray;

@property(nonatomic, strong) NSMutableDictionary *moduleMap;

@end

@implementation BaseModuleManager

+ (instancetype)share {
  static BaseModuleManager *instance;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    if (!instance) {
      instance = [BaseModuleManager new];
    }
  });
  return instance;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.moduleArray = [NSMutableArray array];
    self.moduleMap = [NSMutableDictionary dictionary];
  }
  return self;
}

+ (void)setConfigs:(NSDictionary *)configs {
  [BaseModuleManager share].configs = configs;
}

+ (void)registerModule:(Class)module level:(BaseModuleLevel)level config:(NSDictionary *)config {
  [[BaseModuleManager share].moduleArray addObject:@{
    @"class": module,
    @"level": @(level),
    @"config": config ?: @{}
  }];
}

+ (void)registerModules:(NSArray<Class> *)modules level:(BaseModuleLevel)level {
  [modules enumerateObjectsUsingBlock:^(Class class, NSUInteger idx, BOOL * _Nonnull stop) {
    [self registerModule:class level:level config:@{}];
  }];
}

+ (void)createModules {
  [[BaseModuleManager share] createModules];
}

#pragma mark private method

- (void)createModules {
  NSArray *modules = self.moduleArray;
  [modules enumerateObjectsUsingBlock:^(NSDictionary *moduleInfo, NSUInteger idx, BOOL * _Nonnull stop) {
    [self createModule:moduleInfo];
  }];
}

- (BOOL)createModule:(NSDictionary *)module {
  BaseModuleLevel level = (BaseModuleLevel) ([module[@"level"] integerValue]);
  Class class = (Class) module[@"class"];
  NSDictionary *config = module[@"config"];

  NSMutableDictionary *combinedConfig = [NSMutableDictionary dictionary];
  [combinedConfig setValuesForKeysWithDictionary:self.configs];
  [combinedConfig setValuesForKeysWithDictionary:config];

  BaseModule *model = [[class alloc] init];
  if (!model) {
    return NO;
  }
  
  NSMutableArray *currentLevelModules = self.moduleMap[@(level)];
  if (!currentLevelModules) {
    self.moduleMap[@(level)] = [[NSMutableArray alloc] initWithObjects:module, nil];
  } else {
    [currentLevelModules addObject:module];
  }

  return YES;
}

- (BaseModule *)queryModuleWithClass:(Class)class {
  NSArray *modules = [[self.moduleMap allValues] copy];
  __block BaseModule *queriedModule = nil;
  [modules enumerateObjectsUsingBlock:^(NSArray *levelArray, NSUInteger idx, BOOL * _Nonnull levelArrayStop) {
    if (levelArray) {
      [levelArray enumerateObjectsUsingBlock:^(BaseModule *module, NSUInteger idx, BOOL * _Nonnull moduleStop) {
        if ([module isMemberOfClass:class]) {
          queriedModule = module;
          *moduleStop = YES;
        }
      }];
    }
    * levelArrayStop = queriedModule != nil;
  }];
  return queriedModule;
}

@end
