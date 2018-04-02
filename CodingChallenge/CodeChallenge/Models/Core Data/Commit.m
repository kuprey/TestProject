#import "Commit.h"
#import "NSDictionary+Networking.h"
#import <MagicalRecord/MagicalRecord.h>

@interface Commit ()

// Private interface goes here.

@end

@implementation Commit

+ (instancetype)entityWithPayload:(NSDictionary *)payload branchName:(NSString *)branchName inContext:(NSManagedObjectContext *)context {
    
    id hash = [payload networkObjectForKey:@"sha"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"commit_hash == %@", hash];
    
    Commit *commit = [Commit MR_findFirstWithPredicate:predicate inContext:context];
    if (commit == nil){
        commit = [Commit MR_createEntityInContext:context];
        commit.commit_hash = hash;
    }
    id payload_commit = [payload networkObjectForKey:@"commit"];
    commit.author_name = [[payload_commit networkObjectForKey:@"author"] networkObjectForKey:@"email"];
    commit.commit_message = [payload_commit networkObjectForKey:@"message"];
    commit.branch_name = branchName;
    commit.author_avatar_url = [[payload networkObjectForKey:@"author"] networkObjectForKey:@"avatar_url"];
    [commit setAvatar:[Avatar entityWithPayload:nil url:commit.author_avatar_url inContext:context]];
    return commit;
}

@end
