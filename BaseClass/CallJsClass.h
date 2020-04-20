 
typedef NS_ENUM(NSInteger,currencyType)
{
    
    ETH,
    BTC,
    ETP
};


typedef void(^asynCallSuccessBlock)(id data);
typedef void(^synCallSuccessBlock)(id data);
typedef void(^callFailBlock)(id data);


#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
@interface CallJsClass : UIView<WKUIDelegate,WKNavigationDelegate,UIWebViewDelegate>
+(instancetype)OCCallJs;


-(void)ExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock currentViewFun:(UIView*)curentView;

-(void)ExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock backAsynResultBlock:(asynCallSuccessBlock)asynResult currentViewFun:(UIView*)curentView;


+(instancetype)createJsObject;


-(void)ExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock backAsynResultBlock:(asynCallSuccessBlock)asynResult currencyName:(currencyType)cName currentViewFun:(UIView*)curentView;

-(void)ExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock currencyName:(currencyType)cName currentViewFun:(UIView*)curentView;
@end
