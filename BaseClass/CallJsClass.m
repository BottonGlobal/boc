//
//  CallJsClass.m
//  ScmProject
//
//  Created by zhoudong on 2018/8/4.
//  Copyright © 2018年 session. All rights reserved.
//


#import "CallJsClass.h"
#import <UIKit/UIKit.h>


@implementation CallJsClass{
    
    WKWebView* _webView;
    
     synCallSuccessBlock _synSuccBlock;
     asynCallSuccessBlock _aSynSuccBlock;
     callFailBlock _failBlock;
     NSString* _function;
    UIView* cunView;
}

static CallJsClass * instance=nil;
+(instancetype)OCCallJs{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance=[[CallJsClass alloc] init];
    });
    
    return instance;
}
+(instancetype)createJsObject{
    
    return [[self alloc] init];
}

-(void)ExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock currentViewFun:(UIView*)curentView{
    
    _synSuccBlock = succBlock;
    _failBlock = failBlock;
    _function = function;
    cunView = curentView;
   
    [self loadWebView:BTC];
}

-(void)ExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock backAsynResultBlock:(asynCallSuccessBlock)asynResult currentViewFun:(UIView*)curentView{
     cunView = curentView;
    _synSuccBlock = succBlock;
    _failBlock = failBlock;
    _aSynSuccBlock = asynResult;
    
      _function = function;
     [self loadWebView:BTC];
    
}



-(void)ExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock currencyName:(currencyType)cName currentViewFun:(UIView*)curentView{
    
    _synSuccBlock = succBlock;
    _failBlock = failBlock;
    _function = function;
    cunView = curentView;
    
    [self loadWebView:cName];
}

-(void)ExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock backAsynResultBlock:(asynCallSuccessBlock)asynResult currencyName:(currencyType)cName currentViewFun:(UIView*)curentView{
    cunView = curentView;
    _synSuccBlock = succBlock;
    _failBlock = failBlock;
    _aSynSuccBlock = asynResult;
    
    _function = function;
     [self loadWebView:cName];
    
}


- (WKWebView *)loadWebView:(currencyType)type{
    if (!_webView) {
        
        WKWebViewConfiguration *wkConfig =[[WKWebViewConfiguration alloc]init];
          
        wkConfig.preferences.javaScriptEnabled = YES;
        /** 默认是不能通过JS自动打开窗口的，必须通过用户交互才能打开 */
        wkConfig.preferences.javaScriptCanOpenWindowsAutomatically = YES;
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) configuration:wkConfig];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
       // NSURL *baseURL = [NSURL fileURLWithPath: [[NSBundle mainBundle] bundlePath]];
        [self addSubview:_webView];
        [cunView addSubview:self];
    }
    
    NSString* htmlName = @"coinjs";
    switch (type) {
        case BTC:
            htmlName = @"coinjs";
            break;
            
        case ETP:
            htmlName = @"metaverse";
            break;
        default:
            
            break;
    }
    NSString* str = [NSString stringWithFormat:@"%@/setcookie.html",Cloud_PRO];
    
    NSURL *baseURL = [NSURL URLWithString:str];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:baseURL];
      [_webView loadRequest:request];
    return _webView;
    
}

-(void)dealloc{
    
    
}

//js 调用oc
- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message{
 
    if(_aSynSuccBlock)
        _aSynSuccBlock([message.body objectForKey:@"body"]);
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    //开始加载
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    //加载完成
    //这里可以接受web前端的方法，用来初始化web页面的信息
    if(_function==nil || _failBlock==nil || _synSuccBlock==nil)return;
    
   
    [webView evaluateJavaScript:_function completionHandler:^(id _Nullable item, NSError * _Nullable error) {
        if(!error){
               self->_synSuccBlock(item);
            
        }else{
            self->_failBlock(error);
        }
    }];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
    //网络错误
      self->_failBlock(error);
}



@end
