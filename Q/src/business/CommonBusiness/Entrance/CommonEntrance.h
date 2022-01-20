//
//  CommonEntrance.h
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "BaseEntrance.h"

NS_ASSUME_NONNULL_BEGIN

@class BaseApplicationDelegate;
@class BaseWindowSceneDelegate;
@class BaseScene;

@interface CommonEntrance : BaseEntrance

+ (void)launchWithApplicationDelegate:(BaseApplicationDelegate *)delegate;

+ (void)launchWithWindowSceneDelegate:(BaseWindowSceneDelegate *)delegate withScene:(BaseScene *)scene;

@end

NS_ASSUME_NONNULL_END
