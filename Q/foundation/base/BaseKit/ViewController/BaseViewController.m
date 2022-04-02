//
//  BaseViewController.m
//
//  Created by XQ on 2022/1/24.
//

#import "BaseViewController.h"
#import "BaseKitHeader.h"

@interface BaseViewController ()

@property (nonatomic, strong) NSMutableArray<ViewModel *> *viewModels;

@end

@implementation BaseViewController

+ (NSString *)scheme {
    NSAssert(NO, @"未实现Scheme");
    return @"";
}

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
    
    LoggerInfo(@"viewDidLoad(params): %@", self.params);
    self.view.backgroundColor = [UIColor colorNamed:@"BackgroundColor"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    BOOL hideNavigationBar = self.hideNavigationBar;
    BOOL hideTabBar = self.hideTabBar;
    self.navigationController.navigationBar.hidden = hideNavigationBar;
    self.tabBarController.tabBar.hidden = hideTabBar;
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
    LoggerInfo(@"dealloc: %@", [self class]);
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.statusBarStyle;
}

- (BOOL)prefersStatusBarHidden {
    return self.hideStatusBar;
}

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

@end
