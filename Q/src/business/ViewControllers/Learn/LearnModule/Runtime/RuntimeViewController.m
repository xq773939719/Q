//
//  RuntimeViewController.m
//
//  Created by XQ on 2023/12/6.
//

#import "RuntimeViewController.h"

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
