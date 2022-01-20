//
//  HomeViewController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "HomeViewController.h"

#import "BaseColor.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.view.backgroundColor = [BaseColor redColor];
}

@end
