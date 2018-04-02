

#import <Foundation/Foundation.h>
#import <MagicalRecord/MagicalRecord.h>
#import "PersistencyManagerProtocol.h"

@interface CommitsStorageManager : NSObject<PersistencyManagerProtocol>

- (instancetype)initWithContext:(NSManagedObjectContext *)context;

@end
