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

- (void)viewDidLoad {
    [super viewDidLoad];
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
