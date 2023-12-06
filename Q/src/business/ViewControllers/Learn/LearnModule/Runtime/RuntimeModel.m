//
//  RuntimeModel.m
//
//  Created by XQ on 2023/12/6.
//

#import "RuntimeModel.h"

@implementation ARuntimeModel

// 定义了aFunc

- (void)bFunc {
    NSLog(@"%@", @(__func__));
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"第一次机会 %@", @(__func__));
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"第二次机会 %@", @(__func__));
    return nil;
    // return [BRuntimeModel new];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"第三次机会 %@", @(__func__));
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    // return [NSMethodSignature methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"第三次机会 %@, %@", @(__func__), anInvocation);
    BRuntimeModel *model = [BRuntimeModel new]; // self;
    anInvocation.target = model;
    anInvocation.selector = @selector(hook);
    [anInvocation invoke];
}

/**
 第一次机会 +[ARuntimeModel resolveInstanceMethod:]
 第二次机会 -[ARuntimeModel forwardingTargetForSelector:]
 第三次机会 -[ARuntimeModel methodSignatureForSelector:]
 第一次机会 +[ARuntimeModel resolveInstanceMethod:]
 第三次机会 -[ARuntimeModel forwardInvocation:], <NSInvocation: 0x60000175c180>
 -[BRuntimeModel hook]
 */

@end

@implementation BRuntimeModel

- (void)aFunc {
    NSLog(@"%@", @(__func__));
}

- (void)hook {
    NSLog(@"%@", @(__func__));
}

@end
