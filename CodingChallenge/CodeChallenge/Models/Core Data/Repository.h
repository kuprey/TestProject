#import "_Repository.h"
#import "Avatar.h"

@interface Repository : _Repository
+ (instancetype)entityWithPayload:(NSDictionary *)payload
                             rank:(NSUInteger)rank
                        inContext:(NSManagedObjectContext *)context;

+ (instancetype)entityWithRepositoryID:(NSNumber *)repoID inContext:(NSManagedObjectContext *)context;
@end
