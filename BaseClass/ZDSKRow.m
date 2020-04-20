 
#import "ZDSKRow.h"

@implementation ZDSKRow

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier data:(NSDictionary*)data rowHeight:(float)rowHeight {
    if (self = [super init]) {
        self.cellIdentifier = cellIdentifier;
        self.data = data;
        self.rowHeight = rowHeight;
    }
    return self;
}

@end
