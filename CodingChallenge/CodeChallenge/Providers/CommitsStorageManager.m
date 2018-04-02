//
//  CommitsStorageManager.m
//  CodeChallenge
//
//  Created by MAC_A_120413 on 4/1/18.
//

#import "CommitsStorageManager.h"
#import "Repository.h"
#import "Commit.h"
#import "Avatar.h"
#import "Branch.h"

@interface CommitsStorageManager()

@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSMutableArray *branches;

@end


@implementation CommitsStorageManager

- (instancetype)initWithContext:(NSManagedObjectContext *)context{
    self = [super init];
    if (self != nil) {
        self.context = context;
        self.branches = [NSMutableArray array];
    }
    return self;
}


- (void)createBranchesWithPayloads:(NSArray<NSDictionary *> *)payloads{
    [self.branches removeAllObjects];
    for (NSDictionary *payload in payloads){
        Branch *branch = [Branch branchWithPayload:payload];
        [self.branches addObject:branch];
    }
}


- (void)createCommitsWithPayloads:(NSArray<NSDictionary *> *)payloads{
    for (NSDictionary *payload in payloads){
        Commit *c = [Commit entityWithPayload:payload branchName:@"" inContext:self.context];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.sha LIKE %@", c.commit_hash];
        Branch *branch = [[self.branches filteredArrayUsingPredicate:predicate] firstObject];
        c.branch_name = branch.name;
    }
    [self.context MR_saveOnlySelfAndWait];
}


- (void)resetStorage {
    NSFetchRequest *request = [Commit fetchRequest];
    request.predicate = [NSPredicate predicateWithFormat:@"commit_hash != null"];
    NSArray *result = [Commit MR_executeFetchRequest:request inContext:self.context];
    for (Commit *commit in result){
        [commit MR_deleteEntityInContext:self.context];
    }
    [self.context MR_saveOnlySelfAndWait];
}


@end
