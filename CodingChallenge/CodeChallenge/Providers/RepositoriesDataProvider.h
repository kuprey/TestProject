

#import <Foundation/Foundation.h>
#import "DataProviderProtocol.h"
#import "RepositoryCellModel.h"

@interface RepositoriesDataProvider : NSObject<DataProviderProtocol>
@property (weak,   nonatomic) id<DataConsumer> dataConsumer;
@end
