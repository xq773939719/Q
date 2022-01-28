//
//  RouteMap.m
//  Q
//
//  Created by XQ on 2022/1/23.
//

#import "RouteMap.h"
#import "Logger.h"

static NSString *PREFIX_ROUTE = @"q://";

@interface RouteMap ()

@property (nonatomic, strong) NSLock *lock;
@property (nonatomic, strong) NSMutableDictionary<NSString *, Class> *routeMap;

@end

@implementation RouteMap

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.lock = [NSLock new];
    self.routeMap = [NSMutableDictionary dictionary];
  }
  return self;
}

- (BOOL)registerScheme:(NSString *)scheme withClass:(Class)className {
  [self.lock lock];
  
  if (![scheme hasPrefix:PREFIX_ROUTE]) {
    LoggerError(@"非法路由前缀路由");
    return NO;
  }
  if ([self.routeMap objectForKey:scheme]) {
    NSAssert(NO, @"不允许同名路由");
    [self.lock unlock];
    return NO;
  }
  
  LoggerInfo(@"[RouteMap] -> 注册scheme: %@, className: %@", scheme, className);
  [self.routeMap setObject:className forKey:scheme];
  [self.lock unlock];
  return YES;
}

- (Class)getClass:(NSString *)scheme {
  Class class = nil;
  [self.lock lock];
  class = [self.routeMap objectForKey:scheme];
  [self.lock unlock];
  LoggerInfo(@"[RouteMap] -> 获取scheme: %@, 对应className: %@", scheme, class);
  return class;
}

@end
