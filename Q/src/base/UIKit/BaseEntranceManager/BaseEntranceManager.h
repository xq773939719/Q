//
//  BaseEntranceManager.h
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import <Foundation/Foundation.h>

#import "BaseAppStatusProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BaseEntranceModuleProtocal

// 注册模块
- (void)registerModules;

// 启动模块
- (void)createModules;

@end

@interface BaseEntranceManager : NSObject <BaseEntranceModuleProtocal, BaseAppStatusProtocal>

- (void)launchWithApplication:(UIApplication *)application;

@end

NS_ASSUME_NONNULL_END
