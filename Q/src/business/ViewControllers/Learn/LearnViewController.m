//
//  LearnViewController.m
//
//  Created by XQ on 2022/1/21.
//

#import "LearnViewController.h"
#import "LearnDataProvider.h"
#import "LearnCellModel.h"

static NSString *cellId = @"LearnViewControllerCellId";

@interface LearnViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LearnDataProvider<BaseModelProviderProtocol> *dataProvider;
@property (nonatomic, strong) NSArray<LearnCellModel *> *models;

@end

@implementation LearnViewController

+ (NSString *)scheme {
    return @"q://vc/learn";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.viewControllerName = @"学习";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor colorNamed:@"BackgroundColor"];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.rootContainer);
    }];
}

- (void)setupViews {
    
}

#pragma mark - Lazy Load

- (LearnDataProvider<BaseModelProviderProtocol> *)dataProvider {
    if (_dataProvider) return _dataProvider;
    _dataProvider = [LearnDataProvider new];
    return _dataProvider;
}

- (NSArray<LearnCellModel *> *)models {
    if (_models) return _models;
    _models = self.dataProvider.models;
    return _models;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LearnCellModel *model = self.models[indexPath.row];
    model.onClick();
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LearnCellModel *model = self.models[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = model.title;
    return cell;
}

@end
