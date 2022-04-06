//
//  UIApplication+Base.m
//
//  Created by XQ on 2022/1/21.
//

#import "UIApplication+Base.h"
#import <objc/runtime.h>

static NSString *windowKey = @"windowKey";

@implementation UIApplication (Base)

- (void)setWindow:(UIWindow *)window {
    objc_setAssociatedObject(self, &windowKey, window, OBJC_ASSOCIATION_ASSIGN);
}

- (UIWindow *)window {
    return objc_getAssociatedObject(self, &windowKey);
}


@end
