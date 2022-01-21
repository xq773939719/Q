//
//  TabBarControllerDataProvider.h
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "BaseHeader.h"

NS_ASSUME_NONNULL_BEGIN

@class BaseNavigationController;

@interface TabBarControllerDataProvider : NSObject

- (NSArray<UINavigationController *> *)childViewControllers;

@end

NS_ASSUME_NONNULL_END
