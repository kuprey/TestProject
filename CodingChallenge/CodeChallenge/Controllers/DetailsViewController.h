

#import <UIKit/UIKit.h>
#import "DataProviderProtocol.h"

@interface DetailsViewController : UIViewController<DataConsumer>

- (void)loadRepositoryWithID:(NSNumber *)repoID;

@end
