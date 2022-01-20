//
//  FeatureViewController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "FeatureViewController.h"

#import "BaseColor.h"

@interface FeatureViewController ()

@end

@implementation FeatureViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.view.backgroundColor = [BaseColor greenColor];
}

@end
