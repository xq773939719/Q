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
    NSObject *a = [NSObject new];
    [a performSelector:@selector(func)];
    [NSObject performSelector:@selector(classFunc)];
}

@end
