 

#import "CallJsClass.h"
#import <UIKit/UIKit.h>
 #import <JavaScriptCore/JavaScriptCore.h>
@implementation CallJsClass{
    
    WKWebView* _webView;
    
      UIWebView* sysWebview;
    
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



-(void)getAddressExecuFun:(NSString*)function backResultBlock:(synCallSuccessBlock)succBlock backFailBlock:(callFailBlock)failBlock currencyName:(currencyType)cName currentViewFun:(UIView*)curentView{
    
    _synSuccBlock = succBlock;
    _failBlock = failBlock;
    _function = function;
    cunView = curentView;
    
   
    if(sysWebview == nil){
        
        UIWebView* webView = [UIWebView new];
        sysWebview  =webView;
        webView.frame = CGRectMake(0, 0,0, 0);
        [self addSubview:_webView];
        [cunView addSubview:self];
        webView.delegate =self;
    }
    
    if(cName == Bck){
        NSURL*url = [[NSBundle mainBundle] URLForResource:@"getaddress.html" withExtension:nil];
        NSURLRequest*request = [NSURLRequest requestWithURL:url];
        [sysWebview loadRequest:request];
    }else if(cName == GIT){
        NSURL*url = [[NSBundle mainBundle] URLForResource:@"getaddress.html" withExtension:nil];
        NSURLRequest*request = [NSURLRequest requestWithURL:url];
        [sysWebview loadRequest:request];
    } else{
        NSURL*url = [[NSBundle mainBundle] URLForResource:@"getaddress.html" withExtension:nil];
           NSURLRequest*request = [NSURLRequest requestWithURL:url];
           [sysWebview loadRequest:request];
        
    }
    
   
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{

    
      NSString* abc =  [webView stringByEvaluatingJavaScriptFromString:_function];
    
         self->_synSuccBlock(abc);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    self->_failBlock(error);
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
            
        case VEE:
            htmlName = @"vee";
            break;
       
        case BTCNew:
            htmlName = @"btcChain";
            break;
      
        case ETPNew:
            htmlName = @"etpChain";
            break;
            
        case PrivateKeyAndAddress:
            htmlName = @"privateAddress";
            break;
            
        case ONT:
            htmlName = @"ont";
            break;
            
        case WICC:
            htmlName = @"wiccChain";
            break;
        case LTC:
            htmlName = @"ltcChain";
            break;
            
        case BCH:
            htmlName = @"bchChain";
            break;
            
        case ETC:
            htmlName = @"etcChain";
            break;
            
        case ETrue:
            htmlName = @"trueChain";
            break;
            
        case Bck:
            htmlName = @"bckChain";
            break;
            
        case GIT:
            htmlName = @"gitChain";
            break;
            
        default:
            
            break;
    }
    htmlName = @"getaddress";
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:htmlName ofType:@"html"];
    
   
    UIWebView* webView = [UIWebView new];
          sysWebview  =webView;
          webView.frame = CGRectMake(0, 0,0, 0);
          [self addSubview:_webView];
          [cunView addSubview:self];
          webView.delegate =self;
      
    NSURL *baseURL = [NSURL fileURLWithPath:htmlPath];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:baseURL];
      [webView loadRequest:request];
    return nil;
    
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
