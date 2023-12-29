//
//  RuntimeViewController.m
//
//  Created by XQ on 2023/12/6.
//

#import "RuntimeViewController.h"

/*
+ (NSTimeInterval)processStartTime
{   // 单位是毫秒
    struct kinfo_proc kProcInfo;
    if ([self processInfoForPID:[[NSProcessInfo processInfo] processIdentifier] procInfo:&kProcInfo]) {
        return kProcInfo.kp_proc.p_un.__p_starttime.tv_sec * 1000.0 + kProcInfo.kp_proc.p_un.__p_starttime.tv_usec / 1000.0;
        
    } else {
        NSAssert(NO, @"无法取得进程的信息");
        return 0;
    }
}

+ (BOOL)processInfoForPID:(int)pid procInfo:(struct kinfo_proc*)procInfo {
    int cmd[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PID, pid};
    size_t size = sizeof(*procInfo);
    return sysctl(cmd, sizeof(cmd)/sizeof(*cmd), procInfo, &size, NULL, 0) == 0;
}
 
 // 单位计算为毫秒
 CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
 CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
 NSLog(@"%f", end - start);
 
 */

@implementation Task

- (void)resume {
    LoggerInfo(@"[%@] -> Start.%@", [self class], self);
    __weak typeof(self) weakSelf = self;
    
    // 1
    void (^A)(void(^)(void), void(^)(NSError *)) = ^(void(^successHandler)(void), void(^failureHandler)(NSError *)){
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        LoggerInfo(@"[%@] -> 1.%@", @(__func__), strongSelf);
        [TopmostView.viewForApplicationWindow makeToast:@"1"];
        NSInteger delay = 1; // 非同一个runloop
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (successHandler) {
                successHandler();
            }
        });
    };
    
    // 2
    void (^B)(void(^)(void), void(^)(NSError *)) = ^(void(^successHandler)(void), void(^failureHandler)(NSError *)){
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        LoggerInfo(@"[%@] -> 2.%@",  @(__func__), strongSelf);
        [TopmostView.viewForApplicationWindow makeToast:@"2"];
        NSInteger delay = 1; // 非同一个runloop
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (successHandler) {
                successHandler();
            }
        });
    };
    
    // 3
    void (^C)(void(^)(void), void(^)(NSError *)) = ^(void(^successHandler)(void), void(^failureHandler)(NSError *)){
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        LoggerInfo(@"[%@] -> 3.%@",  @(__func__), strongSelf);
        [TopmostView.viewForApplicationWindow makeToast:@"3"];
        NSInteger delay = 1; // 非同一个runloop
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (successHandler) {
                successHandler();
            }
        });
    };
    
    void (^selfHolder)(void) = ^() {
        LoggerInfo(@"[%@] -> Holder.%@", @(__func__), self);
        [TopmostView.viewForApplicationWindow makeToast:@"SelfHolder End."];
    };
    
    void (^successHandler)(void) = ^() {
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) return;
        LoggerInfo(@"[%@] ->Success End.%@", @(__func__), strongSelf);
        [TopmostView.viewForApplicationWindow makeToast:@"Success End."];
        selfHolder();
    };
    void (^failureHandler)(NSError *) = ^(NSError *error) {
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) return;
        LoggerInfo(@"[%@] ->Failure End.%@", @(__func__), strongSelf);
        [TopmostView.viewForApplicationWindow makeToast:@"Failure End."];
        selfHolder();
    };
    
    // 前提: Task对象使用时如果没有被外部强引用
    // 现象: 内部嵌套block完成链式调用，但是会出现无法完成链式的情况。
    // ① 以上5个block如果全部使用strongSelf，非同一个runloop周期内，1 -> 2 -> 3 根本无法链式调用，只会执行完1 task就销毁了。
    // ② 但是以上最后两个block(因为作为了入参传递)一旦有一处使用到self，则强引用self，，1 -> 2 -> 3可以顺利链式执行到最后。
    
    /// 1 -> 2 -> 3 -> successHandle || failureHandler
    A(^(){
        B(^{
            C(successHandler, failureHandler);
        }, failureHandler);
    }, failureHandler);
    
}

@end

@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

+ (void)load {
    /*
    //调换IMP
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
            {
                Method originalMethod = class_getInstanceMethod([NSObject class], @selector(a:));
                Method newMethod = class_getInstanceMethod([NSObject class], @selector(b:));
                method_exchangeImplementations(originalMethod, newMethod);
            }
    });
     */
}

+ (NSString *)scheme {
    return @"q://vc/runtime";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
    [self.view addGestureRecognizer:tap];
    [[tap rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        Task *task = [Task new];
        [task resume];
    }];
}

@end
