

#import "DetailsViewController.h"
#import "CommitCell.h"
#import "DataProviderProtocol.h"
#import "CommitsDataProvider.h"

@interface DetailsViewController ()<UITableViewDataSource, UITableViewDelegate, DataConsumer>

@property (nonatomic, weak  ) IBOutlet UITableView *table;
@property (nonatomic, strong) id<DataProviderProtocol> provider;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.table registerNib:[CommitCell nib] forCellReuseIdentifier:[CommitCell identifier]];
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.table addSubview:refresh];
    self.table.alwaysBounceVertical = YES;
    [self.provider refresh];
}

- (void)loadRepositoryWithID:(NSNumber *)repoID{
    self.provider = [[CommitsDataProvider alloc] initWithRepositoryID:repoID];
    self.provider.dataConsumer = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)refresh:(UIRefreshControl *)sender{
    [self.provider refresh];
    [sender endRefreshing];
}

#pragma mark - DataConsumer

- (void)dataProviderDidChangeData:(id<DataProviderProtocol>)dataProvider{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.table reloadData];
    });
}

- (void)dataProvider:(id<DataProviderProtocol>)dataProvider didChangeImageForRowAtIndex:(NSUInteger)index{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.table reloadData];
    });
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.provider numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommitCell *cell = [tableView dequeueReusableCellWithIdentifier:[CommitCell identifier] forIndexPath:indexPath];
    CommitCellModel *model = [self.provider cellModelAtRow:indexPath.row];
    if (model){
        cell.authorAvatarImgView.image = [model avatar];
        cell.commitNameLabel.text = [model commitName];
        cell.commitHashLabel.text = [NSString stringWithFormat:@"Sha: %@", [model commitHash]];
        cell.branchLabel.text = [model branch];
        cell.authorLabel.text = [model author];
    }
    return cell;
}


@end
