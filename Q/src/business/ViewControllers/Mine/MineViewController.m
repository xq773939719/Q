//
//  MineViewController.m
//
//  Created by XQ on 2022/1/19.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

+ (NSString *)scheme {
    return @"q://vc/mine";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.viewControllerName = @"我的";
        
        self.hideStatusBar = YES;
    }
    return self;
}

@end
