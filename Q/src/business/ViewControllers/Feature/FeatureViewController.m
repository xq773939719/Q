//
//  FeatureViewController.m
//
//  Created by XQ on 2022/1/19.
//

#import "FeatureViewController.h"

@interface FeatureViewController ()

@end

@implementation FeatureViewController

+ (NSString *)scheme {
    return @"q://vc/feature";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.viewControllerName = @"特征";
        
    }
    return self;
}

@end
