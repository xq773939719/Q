//
//  LearnViewController.m
//
//  Created by XQ on 2022/1/21.
//

#import "LearnViewController.h"
#import "LearnDataProvider.h"
#import "LearnCellModel.h"

NSString *cellId = @"LearnViewControllerCellId";

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
        
        [self initData];
    }
    return self;
}

- (void)initData {
    self.dataProvider = [LearnDataProvider new];
    self.models = self.dataProvider.models;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor colorNamed:@"BackgroundColor"];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(self.view);
    }];
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
