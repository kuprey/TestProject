

#import <CoreData/CoreData.h>
#import <MagicalRecord/MagicalRecord.h>

#import "RepositoriesDataProvider.h"
#import "RepositoryCellModel.h"

#import "NetworkService.h"
#import "RepositoriesStorageManager.h"

@interface RepositoriesDataProvider ()<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchController;
@property (strong, nonatomic) id<NetworkManagerProtocol> network;
@property (strong, nonatomic) id<PersistencyManagerProtocol> storage;
@property (assign, nonatomic) BOOL isLoading;

@end

@implementation RepositoriesDataProvider

- (instancetype)init {
    self = [super init];

    if (self != nil) {
        [self initNetworkManager];
        [self initCoreDataStorage];
        [self initFetchedResultsController];
    }
    return self;
}

- (void)fetchRepositories{
    if (self.isLoading){
        return;
    }
    self.isLoading = YES;
    NSInteger limit = 20;
    __block NSUInteger offset = [self numberOfRows]/limit + 1;
    __weak typeof(self) _self = self;
    [self.network fetchRepositoriesWithOffset:offset
                                        limit:limit
                                 successBlock:^(NSDictionary *payload) {
                                     NSArray *items = payload[@"items"];
                                     [_self.storage startRepositoriesRankWith:offset * limit];
                                     [_self.storage createRepositoriesWithPayloads:items];
                                     [_self setIsLoading:NO];
                                 }
                                 failureBlock:^(NSError *error) {
                                     [_self setIsLoading:NO];
                                 }];
}

- (void)fetchImages:(NSArray *)items{
    
}

#pragma mark - DataProviderProtocol

- (void)loadMoreItems{
    [self fetchRepositories];
}


- (void)refresh{
    [self.storage resetStorage];
    [self fetchRepositories];
}

- (NSUInteger)numberOfRows {
    return self.fetchController.fetchedObjects.count;
}

- (id)cellModelAtRow:(NSUInteger)row {
    if (row >= self.fetchController.fetchedObjects.count) {
        return nil;
    }
    
    //weak for appling changes at the same context instead of retching it again and saving in child context
    __weak Repository *r = [self.fetchController.fetchedObjects objectAtIndex:row];
    RepositoryCellModel *cellModel = [[RepositoryCellModel alloc] initWithRepository:r];
    __block NSUInteger index = row;
    __weak typeof(self) _self = self;
    if (r.image_url != nil && r.avatar.avatar_data == nil){
        [self.network fetchAvatarForURL:r.image_url
                           successBlock:^(NSData *imageData) {
                               Avatar *a = r.avatar;
                               a.avatar_data = imageData;
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
    self.storage = [[RepositoriesStorageManager alloc] initWithContext:[NSManagedObjectContext MR_contextWithParent:context]];
    
}

- (void)initNetworkManager {
    self.network = [[NetworkService alloc] init];
}

- (void)initFetchedResultsController {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"objectID != null"];
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    self.fetchController = [Repository MR_fetchAllSortedBy:@"rank"
                                                 ascending:YES
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
