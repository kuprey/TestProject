

#import <Foundation/Foundation.h>

@protocol PersistencyManagerProtocol <NSObject>

@optional
- (void)createRepositoriesWithPayloads:(NSArray<NSDictionary *> *)payloads;
- (void)createRepositoryWithPayload:(NSDictionary *)payload;
- (void)createCommitWithPayload:(NSDictionary *)payload;
- (void)createCommitsWithPayloads:(NSArray<NSDictionary *> *)payloads;
- (void)createBranchesWithPayloads:(NSArray<NSDictionary *> *)payloads;
- (void)createBranchWithPayload:(NSDictionary *)payload;
- (void)startRepositoriesRankWith:(NSInteger)rank;
- (void)createAvatarWithData:(NSData *)data;

@required
- (void)resetStorage;

@end
