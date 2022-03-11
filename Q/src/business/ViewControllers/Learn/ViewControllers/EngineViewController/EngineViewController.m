//
//  EngineViewController.m
//  Q
//
//  Created by XQ on 2022/1/24.
//

#import "EngineViewController.h"

@interface EngineViewController ()

@property (nonatomic, strong) CRONView *chronosView;

@end

@implementation EngineViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hideNavigationBar = YES;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.chronosView = [CRONView new];
    self.chronosView.frame = self.view.bounds;
    self.chronosView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.chronosView];
}

@end
