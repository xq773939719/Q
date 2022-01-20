//
//  TabBarControllerDataProvider.h
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "BaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@class BaseNavigationController;

@interface TabBarControllerDataProvider : BaseObject

- (NSArray<BaseNavigationController *> *)childViewControllers;

@end

NS_ASSUME_NONNULL_END
