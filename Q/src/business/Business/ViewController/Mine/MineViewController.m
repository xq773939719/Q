//
//  MineViewController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "MineViewController.h"
#import <Flutter/Flutter.h>
#import <Chronos/Chronos.h>
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface MineViewController ()

@property (nonatomic, strong) CRONView *chronosView;
@property (nonatomic, strong) IJKFFMoviePlayerController *playerController;

@end

@implementation MineViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.view.autoresizesSubviews = YES;
  self.chronosView = [CRONView new];
  self.chronosView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height / 2);
  self.chronosView.backgroundColor = [UIColor orangeColor];
  [self.view addSubview:self.chronosView];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
  IJKFFOptions *options = [IJKFFOptions optionsByDefault];
  NSURL *url = [NSURL URLWithString:@"http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4"];

  self.playerController = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:options];
  self.playerController.view.frame = CGRectMake(0, self.view.bounds.size.height / 2, self.view.bounds.size.width, self.view.bounds.size.height / 2);
  self.playerController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
  self.playerController.view.backgroundColor = [UIColor darkGrayColor];
  self.playerController.scalingMode = IJKMPMovieScalingModeAspectFit;
  self.playerController.shouldAutoplay = YES;
  [self.playerController prepareToPlay];
  [self.view addSubview:self.playerController.view];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  [self.playerController stop];
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
