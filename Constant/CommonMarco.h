
#ifndef Communication_CommonMarco_h
#define Communication_CommonMarco_h

#define DocumentDirectory   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

// Dictionary
#define EDDictionaryWithObjectsAndKeys(firstObject, ...) [NSDictionary dictionaryWithObjectsAndKeys:firstObject, ##__VA_ARGS__, nil];


#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shareInstance;

#define IMPLEMENTE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shareInstance { \
    static className *shared##className = nil; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        shared##className = [[self alloc] init]; \
    }); \
    return shared##className; \
}  

// mode parse from Dictionay
#define DEFINE_PARSE_DICTIONAY_FOR_CLASS(className) \
\
+ (className *)parseFromJsonDic:(NSDictionary *)dic;

#define IMPLEMENTE_PARSE_DICTIONAY_FOR_CLASS_BEGIN(className) \
\
+ (className *)parseFromJsonDic:(NSDictionary *)dic{ \
    if (![dic isKindOfClass:[NSDictionary class]]){ \
        EDLogError(@"[%@] dic is not NSDictionary", NSStringFromClass([className class])); \
        return nil;\
    }

#define IMPLEMENTE_PARSE_DICTIONAY_FOR_CLASS_END \
}


// mode parse from Array
#define DEFINE_PARSE_ARRAY_FOR_CLASS \
\
+ (NSArray *)parseFromJsonArray:(NSArray *)arr;


#define IMPLEMENTE_PARSE_ARRAY_FOR_CLASS(className) \
\
+ (NSArray *)parseFromJsonArray:(NSArray *)arr{ \
    NSMutableArray *retArr = [NSMutableArray array]; \
    if (![arr isKindOfClass:[NSArray class]]){ \
        EDLogError(@"[%@] arr is no NSArray", NSStringFromClass([className class])); \
        return retArr;\
    }\
    for (NSDictionary *dic in arr){\
        className *item  = [className parseFromJsonDic:dic];\
        if (nil != item){\
            [retArr addObject:item];\
        }\
    }\
    return retArr;\
}


//image
#define AssetImage(path)  (path).length > 0 ? [UIImage imageNamed:(path)] : nil

//String
#define AssectString(param) [(param) isKindOfClass:[NSNumber class]] ? [((NSNumber *)param) stringValue] : ([(param) isKindOfClass:[NSString class]] ? ([[(param) lowercaseString] isEqualToString:@"null"] ? @"" : (param)): @"")





//view
#define LoadViewFormXib(name, ower) LoadViewFormXibAtIndex(name, ower, 0)
#define LoadViewFormXibAtIndex(name, ower, index) [[[NSBundle mainBundle] loadNibNamed:name owner:ower options:nil] objectAtIndex:index];

//self
//#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//notification
#define REGISTER_NOTIFICATION(observer, sel, notif_name, obj) [[NSNotificationCenter defaultCenter]	addObserver:observer selector:sel name:notif_name object:obj];

#define REMOVE_NOTIFICATION(observer, notif_name, obj) [[NSNotificationCenter defaultCenter] removeObserver:observer name:notif_name object:obj];

#define POST_NOTIFICATION(notif_name, obj) [[NSNotificationCenter defaultCenter] postNotificationName:notif_name object:obj];

//
#define ED_DEPRECATED_APP(_version) ED_DEPRECATED_APP_INFO(_version,"")
#define ED_DEPRECATED_APP_INFO(_version,...) __attribute__((deprecated(__VA_ARGS__)))
#define ED_AVAILABLE_APP(_version)
#define ED_UNAVAILABLE_APP_INFO(_version,...) __attribute__((unavailable))

#endif
