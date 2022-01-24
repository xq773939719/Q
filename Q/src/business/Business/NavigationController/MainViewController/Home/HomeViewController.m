//
//  HomeViewController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

+ (void)load {
  [[Router share] registerScheme:@"q://vc/home" withClass:[self class]];
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.viewControllerName = @"主页";
    self.tabBarTitle = @"主页";
  }
  return self;
}

@end
