//
//  BaseApplicationDelegate.h
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BaseEntranceManager;

@protocol BaseApplicationEntranceProtocol <NSObject>

@required

- (BaseEntranceManager *)onDelegateInit;

@end

@interface BaseApplicationDelegate : UIResponder <UIApplicationDelegate, BaseApplicationEntranceProtocol>

@property (nonatomic, strong, readonly) BaseEntranceManager *entranceManager;

@end

NS_ASSUME_NONNULL_END
