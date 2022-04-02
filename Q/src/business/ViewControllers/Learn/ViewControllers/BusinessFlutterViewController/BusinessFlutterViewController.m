//
//  BusinessFlutterViewController.m
//
//  Created by XQ on 2022/1/24.
//

#import "BusinessFlutterViewController.h"

@interface BusinessFlutterViewController ()

@property (nonatomic, strong) FlutterViewController *flutter;

@end

@implementation BusinessFlutterViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hideNavigationBar = YES;
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.flutter = [FlutterViewController new];
    [self addChildViewController:self.flutter];
    [self.view addSubview:self.flutter.view];
    
    self.flutter.hideNavigationBar = YES;
    [self.flutter.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
    
}

@end
