//
//  LoggerEngine.h
//  Q
//
//  Created by XQ on 2022/1/21.
//

#import <Foundation/Foundation.h>

#import "Logger.h"

NS_ASSUME_NONNULL_BEGIN

@class BaseLogConfiguration;

typedef void (^LoggerCheckHandler)(NSString *message);

@interface LoggerEngine : NSObject

@property (nonatomic, strong) LoggerCheckHandler checkHandler;

- (instancetype)initWithConfiguration:(BaseLogConfiguration *)configuration;

- (void)log:(BOOL)asynchronous level:(LoggerLevel)level flag:(LoggerFlag)flag file:(const char *)file function:(const char *)function line:(NSUInteger)line tag:(NSString *)tag format:(NSString *)format args:(va_list)args;

@end

NS_ASSUME_NONNULL_END