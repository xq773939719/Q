//
//  ThreadViewController.m
//
//  Created by XQ on 2022/4/2.
//

#import "ThreadViewController.h"

@interface ThreadViewController ()

@end

@implementation ThreadViewController

+ (NSString *)scheme {
    return @"q://vc/thread";
}
- (void)setupViews {
    [super setupViews];
    [self thread];
    [self dispatch];
    [self operation];
}

- (void)thread {
    [NSThread detachNewThreadWithBlock:^{
        LoggerInfo(@"thread: %@", @"2");
    }];
    LoggerInfo(@"thread: %@", @"1");
}

- (void)dispatch {
    dispatch_async(dispatch_get_main_queue(), ^{
        LoggerInfo(@"dispatch: %@", @"2");
    });
    LoggerInfo(@"dispatch: %@", @"1");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        LoggerInfo(@"dispatch: %@", @"3");
        dispatch_sync(dispatch_get_main_queue(), ^{
            LoggerInfo(@"dispatch: %@", @"4");
        });
        // 子线程dispatch同步主队列 该处阻塞
        LoggerInfo(@"dispatch: %@", @"5");
    });
}

- (void)operation {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        LoggerInfo(@"operation: %@", @"2");
    }];
    
    LoggerInfo(@"operation: %@", @"1");
}

- (void)run {
    
}

@end
