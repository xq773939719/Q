//
//  CommonEntranceManager.h
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "BaseEntranceManager.h"

NS_ASSUME_NONNULL_BEGIN

@class BaseApplicationDelegate;
@class BaseWindowSceneDelegate;
@class BaseScene;

@interface CommonEntranceManager : BaseEntranceManager

+ (void)launchWithApplicationDelegate:(BaseApplicationDelegate *)delegate;

+ (void)launchWithWindowSceneDelegate:(BaseWindowSceneDelegate *)delegate withScene:(BaseScene *)scene;

@end

NS_ASSUME_NONNULL_END
