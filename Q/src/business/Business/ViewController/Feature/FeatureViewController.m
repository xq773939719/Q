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
  
  NSTimeInterval time = 2;
  [NSTimer scheduledTimerWithTimeInterval:time block:^(NSTimer * _Nonnull timer) {
    FlutterViewController *flutterVC = [[FlutterViewController alloc]init];
    [self addChildViewController:flutterVC];
    flutterVC.view.frame = self.view.bounds;
    [flutterVC didMoveToParentViewController:self];
    [self.view addSubview:flutterVC.view];
    [self.navigationController pushViewController:flutterVC animated:YES];
    self.navigationController.navigationBar.hidden = YES;
  } repeats:NO];
}

@end
