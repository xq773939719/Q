//
//  HomeViewController.m
//
//  Created by XQ on 2022/1/19.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

+ (NSString *)scheme {
    return @"q://vc/home";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.viewControllerName = @"主页";
        
    }
    return self;
}

@end
