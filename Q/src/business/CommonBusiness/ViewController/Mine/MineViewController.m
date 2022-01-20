//
//  MineViewController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "MineViewController.h"
#import <Flutter/Flutter.h>
#import <Chronos/Chronos.h>

@interface MineViewController ()

@property (nonatomic, strong) CRONView *chronosView;

@end

@implementation MineViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  self.chronosView = [CRONView new];
  self.chronosView.frame = self.view.bounds;
  self.chronosView.backgroundColor = [UIColor orangeColor];
  [self.view addSubview:self.chronosView];
}

@end

/*
 Flutter 备份
 FlutterViewController *flutterVC = [[FlutterViewController alloc]init];
 [self addChildViewController:flutterVC];
 flutterVC.view.frame = self.view.bounds;
 [flutterVC didMoveToParentViewController:self];
 [self.view addSubview:flutterVC.view];
 [self.navigationController pushViewController:flutterVC animated:YES];
 self.navigationController.navigationBar.hidden = YES;
 */
