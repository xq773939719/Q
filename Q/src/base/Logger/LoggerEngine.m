//
//  LoggerEngine.m
//  Q
//
//  Created by XQ on 2022/1/21.
//

#import "LoggerEngine.h"

#import "BaseLogConfiguration.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

@interface LoggerEngine ()

@property (nonatomic, strong) DDLog *log;

@end

@implementation LoggerEngine

- (instancetype)initWithConfiguration:(BaseLogConfiguration *)configuration {
  self = [super init];
  if (self) {
    self.log = [DDLog new];
  }
  
  return self;
}

- (void)log:(BOOL)asynchronous level:(LoggerLevel)level flag:(LoggerFlag) flag file:(const char *)file function:(const char *)function line:(NSUInteger)line tag:(NSString *)tag format:(NSString *)format, ... {
  va_list args;
  va_start(args, format);
  [self log:asynchronous level:level flag:flag file:file function:function line:line tag:tag format:format args:args];
  va_end(args);
}

- (void)log:(BOOL)asynchronous level:(LoggerLevel)level flag:(LoggerFlag)flag file:(const char *)file function:(const char *)function line:(NSUInteger)line tag:(NSString *)tag format:(NSString *)format args:(va_list)args {
  if (self.checkHandler) {
    va_list copiedArgs;
    va_copy(copiedArgs, args);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:copiedArgs];
    self.checkHandler(message);
  }
  [self.log log:asynchronous level:(DDLogLevel)level flag:(DDLogFlag)flag context:0 file:file function:function line:line tag:tag format:format args:args];
}

@end
