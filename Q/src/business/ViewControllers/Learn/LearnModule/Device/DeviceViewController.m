//
//  DeviceViewController.m
//
//  Created by XQ on 2022/4/6.
//

#import "DeviceViewController.h"

@interface DeviceViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation DeviceViewController

+ (NSString *)scheme {
    return @"q://vc/device";
}

- (void)setupData {
    LoggerInfo(@"[%@] -> isPhone: %@", [self class], @([Platform isPhone]));
}

- (void)setupViews {
    [super setupViews];
    [self addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 50));
        make.center.equalTo(self.rootContainer);
    }];
}

- (UIButton *)button {
    if (_button) {
        return _button;
    }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"点击旋转屏幕" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _button = button;
    return _button;
}

- (void)onButtonClick:(UIButton *)button {
    if (self.isPortrait) {
        self.uiOrientation = UIInterfaceOrientationLandscapeLeft;
    } else if (self.isLandscape) {
        self.uiOrientation = UIInterfaceOrientationPortrait;
    }
}

@end
