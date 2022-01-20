//
//  BaseModuleManager.h
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import <Foundation/Foundation.h>

#import "BaseObject.h"
#import "BaseModule.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseModuleManager: BaseObject

+ (instancetype)share;

+ (void)setConfigs:(NSDictionary *)configs;

+ (void)registerModules:(NSArray<Class> *)modules level:(BaseModuleLevel) level;
+ (void)registerModule:(Class)module level:(BaseModuleLevel)level config:(NSDictionary *)config;

+ (void)createModules;

@end

NS_ASSUME_NONNULL_END
