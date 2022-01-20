//
//  BaseEntranceManager.h
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "BaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@class BaseApplication;

@protocol BaseEntranceModuleProtocal

// 注册模块
- (void)registerModules;

// 启动模块
- (void)createModules;

@end

@interface BaseEntranceManager : BaseObject <BaseEntranceModuleProtocal>

- (void)launchWithApplication:(BaseApplication *)application;

@end

NS_ASSUME_NONNULL_END
