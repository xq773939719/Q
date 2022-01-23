//
//  Router.m
//  Q
//
//  Created by XQ on 2022/1/23.
//

#import "Router.h"
#import "RouteMap.h"

@interface Router ()

@property (nonatomic, strong) UINavigationController *rootNavigationController;
@property (nonatomic, strong) RouteMap *routeMap;

@end

@implementation Router

+ (void)load {
  [self share];
}

+ (instancetype)share {
  static Router *instance;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    if (!instance) {
      instance = [Router new];
    }
  });
  return instance;
}

- (void)configRootNavigationController:(UINavigationController *)rootNavigationController {
  self.rootNavigationController = rootNavigationController;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.routeMap = [RouteMap new];
  }
  return self;
}

- (BOOL)registerScheme:(NSString *)scheme withClass:(Class)className {
  return [self.routeMap registerScheme:scheme withClass:className];
}

- (BOOL)route:(NSString *)scheme withParams:(NSDictionary *)params {
  Class class = [self.routeMap getClass:scheme];
  if (!class) {
    return NO;
  }
  
  UIViewController *viewController = [[class alloc] init];
  viewController.params = params;
  [self.rootNavigationController pushViewController:viewController animated:YES];
  return YES;
}

@end
