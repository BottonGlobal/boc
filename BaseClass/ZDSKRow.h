 
#import <Foundation/Foundation.h>

@interface ZDSKRow : NSObject
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, strong) id data;
@property (nonatomic, assign) float rowHeight;

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier
                                  data:(NSDictionary*)data
                             rowHeight:(float)rowHeight;

@end
