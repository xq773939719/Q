//
//  ChronosViewController.m
//
//  Created by XQ on 2022/4/6.
//

#import "ChronosViewController.h"

@interface ChronosViewController ()

@property (nonatomic, strong) CRONView *container;

@end

@implementation ChronosViewController

+ (NSString *)scheme {
    return @"q://vc/chronos";
}

- (void)setupViews {
    [super setupViews];
    [self.view addSubview:self.container];
}

- (void)layoutViews {
    [super layoutViews];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Lazy Load

- (CRONView *)container {
    if (_container) return _container;
    _container = [CRONView new];
    _container.backgroundColor = UIColor.flatForestGreenColor;
    _container.userInteractionEnabled = YES;
    return _container;
}

@end
