//
//  ThirdViewController.m
//
//  Created by XQ on 2022/1/19.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

+ (NSString *)scheme {
    return @"q://vc/third";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.viewControllerName = @"引擎";
        
    }
    return self;
}

@end
