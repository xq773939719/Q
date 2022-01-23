//
//  FeatureViewController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "FeatureViewController.h"

@interface FeatureViewController ()

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation FeatureViewController

+ (void)initialize {
  [[Router share] registerScheme:@"q://vc/feature" withClass:[self class]];
  [[Router share] registerScheme:@"q://vc/flutter" withClass:[FlutterViewController class]];
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

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self addTextField];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  self.tabBarController.tabBar.hidden = NO;
  NSTimeInterval time = 2;
  self.timer = [NSTimer scheduledTimerWithTimeInterval:time block:^(NSTimer * _Nonnull timer) {
    [[Router share] route:@"q://vc/flutter" withParams:@{}];
  } repeats:NO];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  [self.timer invalidate];
}

@end
