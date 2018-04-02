

#import <Foundation/Foundation.h>

@protocol DataConsumer;


@protocol DataProviderProtocol <NSObject>
@optional
- (void)refresh;
- (id)cellModelAtRow:(NSUInteger)row;
@property (nonatomic, readonly) NSUInteger numberOfRows;
@property (weak, nonatomic) id<DataConsumer> dataConsumer;

@required
- (void)loadMoreItems;
@end


@protocol DataConsumer <NSObject>
- (void)dataProvider:(id<DataProviderProtocol>)dataProvider didChangeImageForRowAtIndex:(NSUInteger)index;
- (void)dataProviderDidChangeData:(id<DataProviderProtocol>)dataProvider;
@end

