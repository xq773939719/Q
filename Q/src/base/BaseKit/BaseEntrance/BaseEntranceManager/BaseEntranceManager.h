//
//  BaseEntranceManager.h
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "BaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@class BaseApplicationDelegate;
@class BaseWindowSceneDelegate;
@class BaseScene;

@protocol BaseEntranceProtocal <NSObject>

+ (void)launchWithApplicationDelegate:(BaseApplicationDelegate *)delegate;

+ (void)launchWithWindowSceneDelegate:(BaseWindowSceneDelegate *)delegate withScene:(BaseScene *)scene;

+ (void)launch;

@end

@interface BaseEntranceManager : BaseObject <BaseEntranceProtocal>

@end

NS_ASSUME_NONNULL_END
