 

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#improt "CallJsClass.h"
typedef void (^RequestCallBackBlock)(id result, NSInteger startCode, NSString *error);

@interface CreateAddressAndPrivate : NSObject
+(CreateAddressAndPrivate *)sharedCreateAddressAndPrivate;
-(void)creatAddressFun:(UIView*)view;

@property(copy,nonatomic)RequestCallBackBlock backData;
@end
