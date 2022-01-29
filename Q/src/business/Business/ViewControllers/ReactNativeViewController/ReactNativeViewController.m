//
//  ReactNativeViewController.m
//  Q
//
//  Created by XQ on 2022/1/29.
//

#import "ReactNativeViewController.h"

@interface ReactNativeViewController () <RCTBridgeDelegate>

@property (nonatomic, strong) RCTBridge *bridge;

@end

@implementation ReactNativeViewController

+ (void)load {
  [[Router share] registerScheme:@"q://vc/rn" withClass:[self class]];
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self loadBundle];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge {
  NSURL *url = nil;
#if DEBUG
  url = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];

#else
  url = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
  if (url) {
    [self setUpView];
  }
  return url;
}

- (void)loadBundle {
  self.bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:self.bridge
                                                   moduleName:@"QRN"
                                            initialProperties:nil];
  [self.view addSubview:rootView];
  [rootView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.size.equalTo(self.view);
  }];
}


- (void)setUpView {
}

@end
