
#import <Foundation/Foundation.h>

typedef void(^DataSuccessBlock)(NSData *imageData);
typedef void(^SuccessBlock)(NSDictionary *payload);
typedef void(^FailureBlock)(NSError *error);

@protocol NetworkManagerProtocol <NSObject>
- (void)fetchRepositoriesWithOffset:(NSUInteger)offset
                              limit:(NSUInteger)limit
                       successBlock:(SuccessBlock)success
                       failureBlock:(FailureBlock)failure;

- (void)fetchCommitsForRepository:(NSNumber *)repository
                            limit:(NSUInteger)limit
                     successBlock:(SuccessBlock)success
                     failureBlock:(FailureBlock)failure;

- (void)fetchBranchesForRepository:(NSNumber *)repository
                             limit:(NSUInteger)limit
                      successBlock:(SuccessBlock)success
                      failureBlock:(FailureBlock)failure;

- (void)fetchAvatarForAuthor:(NSString *)author
                successBlock:(DataSuccessBlock)success
                failureBlock:(FailureBlock)failure;

- (void)fetchAvatarForURL:(NSString *)url
             successBlock:(DataSuccessBlock)success
             failureBlock:(FailureBlock)failure;

- (void)cancelAllRequests;
@end
