//
//  FeatureViewController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "FeatureViewController.h"

@interface FeatureViewController ()

@end

@implementation FeatureViewController

+ (void)load {
  [[Router share] registerScheme:@"q://vc/feature" withClass:[self class]];
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.viewControllerName = @"特征";
    self.tabBarTitle = @"特征";
  }
  return self;
}

@end
