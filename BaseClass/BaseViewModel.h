 

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id data);
typedef void(^FailBlock)(id data);

@interface BaseViewModel : NSObject
@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailBlock failBlock;

- (NSURLSessionTask*)loadDataWithSuccessBlock:(SuccessBlock)successBlock andFail:(FailBlock)failBlock;

@end
