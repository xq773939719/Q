//
//  BaseModule.h
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, BaseModuleLevel) {
  BaseModuleLevelUnknown = -1,
  BaseModuleLevelSystem = 0,
  BaseModuleLevelCommon = 1,
  BaseModuleLevelBusiness = 2,
};

@protocol BaseModule <NSObject>

@required

- (NSString *)moduleName;
- (BaseModuleLevel)moduleLevel;
- (NSDictionary *)moduleConfig;
- (void)initModule;

@end

@protocol BaseModuleApplicationProtocal <NSObject>

@optional
- (void)onApplicationLaunch;
- (void)onApplicationWillEnterForeground;
- (void)onApplicationDidBecomeActive;
- (void)onApplicationWillResignActive;
- (void)onApplicationDidEnterBackground;
- (void)onApplicationWillTerminate;

@end

@interface BaseModule : NSObject <BaseModule>

- (instancetype)initWithConfig:(NSDictionary *)config;

@end

NS_ASSUME_NONNULL_END
