

#import <Foundation/Foundation.h>
#import "DataProviderProtocol.h"
#import "CommitCellModel.h"

@interface CommitsDataProvider : NSObject<DataProviderProtocol>
@property (weak, nonatomic) id<DataConsumer> dataConsumer;

- (instancetype)initWithRepositoryID:(NSNumber *)repoID;


@end
