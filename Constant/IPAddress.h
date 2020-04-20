 
#import <Foundation/Foundation.h>

@protocol IPAddress <NSObject>



#define SERVICE_LINK_FLAG 2


#if SERVICE_LINK_FLAG == 1

#define Cloud_PRO @"http://192.168.0.136:8031/bbq/"
 
#define Cloud_Exchange @"http://192.168.1.136:8031/bbq/"

#endif

#if SERVICE_LINK_FLAG == 2
//http://quantking.io:9031/bbq/account/webSendCode
#define Cloud_PRO @"http://quantking.io:9031/bbq/"
 
#define Cloud_Exchange @"http://quantking.io:9031/bbq/"


#endif
