//
//  BaseEntranceManager.h
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import <Foundation/Foundation.h>

#import "ProtocolHeader.h"

NS_ASSUME_NONNULL_BEGIN

@class UINavigationController;
@class UIViewController;

@protocol BaseEntranceModuleProtocal

// 根视图控制器
- (UIViewController *)rootViewController;

// 注册模块
- (void)registerModules;

// 启动模块
- (void)createModules;

@end

@interface BaseEntranceManager : NSObject <BaseEntranceModuleProtocal, BaseAppStatusProtocal>

// 根导航控制器
@property (nonatomic, strong, readonly) UINavigationController *rootNavigationController;

- (void)launchWithApplication:(UIApplication *)application;

@end

NS_ASSUME_NONNULL_END
