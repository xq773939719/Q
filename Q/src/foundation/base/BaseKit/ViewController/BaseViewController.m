//
//  BaseViewController.m
//
//  Created by XQ on 2022/1/24.
//

#import "BaseViewController.h"
#import "BaseKitHeader.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIView *rootContainer;
@property (nonatomic, strong) NSMutableArray<ViewModel *> *viewModels;

@end

@implementation BaseViewController

+ (void)initialize {
    NSString *scheme = [self scheme];
    if (!scheme || scheme.length <= 0) {
        return;
    }
    [[Router share] registerScheme:[self scheme] withClass:[self class]];
}

#pragma mark - ViewProtocol

- (void)addSubview:(UIView *)view {
    [self.rootContainer addSubview:view];
}

- (UIView *)rootContainer {
    if (_rootContainer) {
        return _rootContainer;
    }
    _rootContainer = [UIView new];
    _rootContainer.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_rootContainer];
    // 安全区域
    [_rootContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
    }];
    return _rootContainer;
}

#pragma mark - RoutableProtocol

+ (NSString *)scheme {
    return @"";
}

#pragma mark - Life circle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initProperties];
    }
    return self;
}

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LoggerInfo(@"[%@] -> %@", [self class], self.params);
    self.view.backgroundColor = [UIColor colorNamed:@"BackgroundColor"];
    [self initDefaultViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    BOOL hideNavigationBar = self.hideNavigationBar;
    BOOL hideTabBar = self.hideTabBar;
    self.navigationController.navigationBar.hidden = hideNavigationBar;
    self.tabBarController.tabBar.hidden = hideTabBar;
    
    [self setupData];
    [self setupViews];
    [self loadData:^(BOOL success) {
        [self updateViews];
    }];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)dealloc {
    LoggerInfo(@"[%@] -> %@", [self class], @"销毁");
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.statusBarStyle;
}

- (BOOL)prefersStatusBarHidden {
    return self.hideStatusBar;
}

#pragma mark - Origientation

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

#pragma mark - ViewModelProtocol

- (void)bindViewModel:(ViewModel *)viewModel {
    if (!viewModel) {
        return;
    }
    viewModel.delegate = self;
    [viewModel bind];
    [self.viewModels addObject:viewModel];
}

#pragma mark - private method

- (void)initProperties {
    self.viewControllerName = @"ViewControllerName";
    self.params = @{};
    
    self.hideStatusBar = NO;
    self.statusBarStyle = UIStatusBarStyleDefault;
    
    self.hideTabBar = NO;
    self.tabBarTitle = @"TabBarTitle";
    self.tabBarIcon = @"";
    
    self.navigationTitle = @"NavigationTitle";
    self.hideNavigationBar = YES;
}

- (NSArray<ViewModel *> *)viewModels {
    if (_viewModels) {
        return _viewModels;
    }
    _viewModels = [NSMutableArray array];
    return _viewModels;
}

#pragma mark - LogicProtocol

- (void)initDefaultViews {
    
}

- (void)setupData {
    
}

- (void)setupViews {
    
}

- (void)loadData:(void (^)(BOOL))callback {
    
}

- (void)updateViews {
    [self.view updateConstraints];
}

@end
