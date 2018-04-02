#import "Repository.h"
#import "NSDictionary+Networking.h"
#import <MagicalRecord/MagicalRecord.h>


@interface Repository ()

// Private interface goes here.

@end

@implementation Repository

+ (instancetype)entityWithPayload:(NSDictionary *)payload
                             rank:(NSUInteger)rank
                        inContext:(NSManagedObjectContext *)context {
    id identifier = [payload networkObjectForKey:@"id"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"repo_id == %@", identifier];
    Repository *repository = [Repository MR_findFirstWithPredicate:predicate inContext:context];
    if (repository == nil){
        repository = [Repository MR_createEntityInContext:context];
        repository.repo_id = identifier;
    }
    
    repository.repo_name = [payload networkObjectForKey:@"name"];
    repository.owner = [[payload networkObjectForKey:@"owner"] networkObjectForKey:@"login"];
    repository.short_description = [payload networkObjectForKey:@"description"];
    repository.rank = @(rank);
    repository.image_url = [[payload networkObjectForKey:@"owner"] networkObjectForKey:@"avatar_url"];
    [repository setAvatar:[Avatar entityWithPayload:nil url:repository.image_url inContext:context]];
    return repository;
}

+ (instancetype)entityWithRepositoryID:(NSNumber *)repoID inContext:(NSManagedObjectContext *)context{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"repo_id == %@", repoID];
    Repository *repository = [Repository MR_findFirstWithPredicate:predicate inContext:context];
    return repository;
    
}


@end
