//
//  CallJsClass.h
//  ScmProject
//
//  Created by zhoudong on 2018/8/4.
//  Copyright © 2018年 session. All rights reserved.
//
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

//BCT 调用js使用
-(void)ExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock currentViewFun:(UIView*)curentView;

-(void)ExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock backAsynResultBlock:(asynCallSuccessBlock)asynResult currentViewFun:(UIView*)curentView;


//工厂创建该对象
+(instancetype)createJsObject;

//币种通用调用js
-(void)ExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock backAsynResultBlock:(asynCallSuccessBlock)asynResult currencyName:(currencyType)cName currentViewFun:(UIView*)curentView;

-(void)ExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock currencyName:(currencyType)cName currentViewFun:(UIView*)curentView;
@end
