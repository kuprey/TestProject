

#import "CommitsDataProvider.h"

#import "NetworkService.h"
#import "CommitsStorageManager.h"
#import "Repository.h"

@interface CommitsDataProvider ()<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchController;
@property (strong, nonatomic) id<NetworkManagerProtocol> network;
@property (strong, nonatomic) id<PersistencyManagerProtocol> storage;
@property (strong, nonatomic) NSNumber *repoID;


@end

@implementation CommitsDataProvider

- (instancetype)initWithRepositoryID:(NSNumber *)repoID{
    self = [super init];
    if (self != nil) {
        self.repoID = repoID;
        [self initNetworkManager];
        [self initCoreDataStorage];
        [self initFetchedResultsController];
    }
    return self;
}

- (void)fetchBranches{
    __weak typeof(self) _self = self;
    [self.network fetchBranchesForRepository:self.repoID
                                       limit:0
                                successBlock:^(NSDictionary *payload) {
                                    NSArray *items = payload[@"items"];
                                    [_self.storage createBranchesWithPayloads:items];
                                    [_self fetchCommits];
    }
                                failureBlock:^(NSError *error) {
        
    }];
}

- (void)fetchCommits{
    NSInteger limit = 1;
    __weak typeof(self) _self = self;
    [self.network fetchCommitsForRepository:self.repoID
                                      limit:limit
                               successBlock:^(NSDictionary *payload) {
        NSArray *items = payload[@"items"];
        [_self.storage createCommitsWithPayloads:items];
    }
                               failureBlock:^(NSError *error) {
        
    }];
}


#pragma mark - DataProviderProtocol

- (void)loadMoreItems{
    [self fetchCommits];
}

- (void)refresh{
    [self.storage resetStorage];
    [self fetchBranches];
}

- (NSUInteger)numberOfRows {
    return self.fetchController.fetchedObjects.count;
}

- (id)cellModelAtRow:(NSUInteger)row {
    if (row >= self.fetchController.fetchedObjects.count) {
        return nil;
    }
    
    __weak Commit *c = [self.fetchController.fetchedObjects objectAtIndex:row];
    CommitCellModel *cellModel = [[CommitCellModel alloc] initWithCommit:c];
    __block NSUInteger index = row;
    __weak typeof(self) _self = self;
    if (c.avatar.avatar_url != nil && c.avatar.avatar_data == nil){
        [self.network fetchAvatarForURL:c.avatar.avatar_url
                           successBlock:^(NSData *imageData) {
                               c.avatar.avatar_data = imageData;
                               [_self notifyDataConsumerAboutImageDownloadAtIndex:index];
                           }
                           failureBlock:^(NSError *error) {

                           }];
    }
   
    return cellModel;
}

#pragma mark - NSFRC delegate methods
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self notifyDataConsumerAboutDataChange];
}

#pragma mark - private subroutines
- (void)notifyDataConsumerAboutDataChange {
    if (self.dataConsumer != nil && [self.dataConsumer respondsToSelector:@selector(dataProviderDidChangeData:)]) {
        [self.dataConsumer dataProviderDidChangeData:self];
    }
}

- (void)notifyDataConsumerAboutImageDownloadAtIndex:(NSUInteger)index {
    if (self.dataConsumer != nil && [self.dataConsumer respondsToSelector:@selector(dataProvider:didChangeImageForRowAtIndex:)]) {
        [self.dataConsumer dataProvider:self didChangeImageForRowAtIndex:index];
    }
}

#pragma mark - init subroutines

- (void)initCoreDataStorage{
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    self.storage = [[CommitsStorageManager alloc] initWithContext:[NSManagedObjectContext MR_contextWithParent:context]];
    
}

- (void)initNetworkManager {
    self.network = [[NetworkService alloc] init];
}

- (void)initFetchedResultsController {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"objectID != null "];
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    self.fetchController = [Commit MR_fetchAllSortedBy:@"commit_timestamp"
                                                 ascending:NO
                                             withPredicate:predicate
                                                   groupBy:nil
                                                  delegate:self
                                                 inContext:context];
    NSError *error;
    [self.fetchController performFetch:&error];
    
    if (error != nil) {
        NSLog(@"Atata, error: %@", error.localizedDescription);
    }
}


@end
