//
//  IJKViewController.m
//  Q
//
//  Created by XQ on 2022/1/24.
//

#import "IJKViewController.h"

@interface IJKViewController ()

@property (nonatomic, strong) IJKFFMoviePlayerController *playerController;

@end

@implementation IJKViewController

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.hideNavigationBar = YES;
    self.hideStatusBar = YES;
  }
  return self;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  IJKFFOptions *options = [IJKFFOptions optionsByDefault];
  NSURL *url = [NSURL URLWithString:@"http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4"];
  
  self.playerController = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:options];
  self.playerController.view.frame = self.view.bounds;
  self.playerController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
  self.playerController.scalingMode = IJKMPMovieScalingModeAspectFit;
//  self.playerController.shouldAutoplay = YES;
//  [self.playerController prepareToPlay];
  [self.view addSubview:self.playerController.view];
  
  self.view.autoresizesSubviews = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  [self.playerController stop];
}

@end
