//
//  LearnViewController.m
//  Pods
//
//  Created by XQ on 2022/1/19.
//

#import "LearnViewController.h"
#import <Flutter/Flutter.h>

@interface LearnViewController ()

@end

@implementation LearnViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  FlutterViewController *flutterVC = [[FlutterViewController alloc]init];
  //    [self addChildViewController:flutterVC];
  //    flutterVC.view.frame = self.view.bounds;
  //    [flutterVC didMoveToParentViewController:self];
  //    [self.view addSubview:flutterVC.view];
  [self.navigationController pushViewController:flutterVC animated:YES];
  self.navigationController.navigationBar.hidden = YES;
}


@end
