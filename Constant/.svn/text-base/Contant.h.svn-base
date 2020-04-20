//
//  Contant.h
//  ScmProject
//
//  Created by zhoudong on 2018/7/7.
//  Copyright © 2018年 session. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Contant <NSObject>

#define PI 3.14
    
    //屏幕高宽
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

//ipx
#define IS_IPHONEX (ScreenH == 812.0f)?YES:NO
#define navBarHeight ((IS_IPHONEX == YES)? 88.0f:64.0f)
#define bottomY ((IS_IPHONEX == YES)?30.0f:0.0f)

    //系统版本
#define IOSVer [[[UIDevice currentDevice] systemVersion]floatValue]
   
    //app的版本号
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
    
    //app build版本号
#define kAppBuildVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
    
    //weak self
#define WeakSelf(type) __weak typeof(type) weak##type = type

#define ALPHANUM123 @"0123456789."
#define ALPHAN  @"1234567890zxcvbnmasdfghjklpoiuytrewqZXCVBNMLKJHGFDSAQWERTYUIOP._@+"
//#define UserName  @"1234567890zxcvbnmasdfghjklpoiuytrewqZXCVBNMLKJHGFDSAQWERTYUIOP"
#define idcard  @"1234567890xX"
#define NumberAndEng  @"1234567890zxcvbnmasdfghjklpoiuytrewqZXCVBNMLKJHGFDSAQWERTYUIOP"
#define BIGALPHAN  @"1234567890ZXCVBNMLKJHGFDSAQWERTYUIOP"
#define ENGALPHAN     @"1234567890zxcvbnmasdfghjklpoiuytrewqZXCVBNMLKJHGFDSAQWERTYUIOP"

#define ALPHANUM1234 @"0123456789"





@end
