//
//  BusinessFlutterViewController.m
//
//  Created by XQ on 2022/7/11.
//

#import "BusinessFlutterViewController.h"

static BusinessFlutterViewController *instance = nil;

@interface BusinessFlutterViewController ()

@property (nonatomic, strong) FlutterViewController *flutter;

@end

@implementation BusinessFlutterViewController

+ (NSString *)scheme {
    return @"q://vc/flutter";
}

+ (instancetype)alloc {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [super alloc];
        }
    });
    return instance;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return self;
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone {
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self.flutter.engine run];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Lazy Load

- (FlutterViewController *)flutter {
    if (_flutter) return _flutter;
    _flutter = [FlutterViewController new];
    [self addChildViewController:_flutter];
    [self.view addSubview:_flutter.view];
    
    _flutter.hideNavigationBar = YES;
    [_flutter.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
    return _flutter;
}

@end

