//
//  Router.h
//  Q
//
//  Created by XQ on 2022/1/23.
//

#import "BaseHeader.h"

NS_ASSUME_NONNULL_BEGIN

@class UINavigationController;

@interface Router : NSObject

@property (nonatomic, strong, readonly) UINavigationController* rootNavigationController;

+ (instancetype)share;

- (void)configRootNavigationController:(UINavigationController *)rootNavigationController;

- (BOOL)registerScheme:(NSString *)scheme withClass:(Class)className;

- (BOOL)route:(NSString *)scheme withParams:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
