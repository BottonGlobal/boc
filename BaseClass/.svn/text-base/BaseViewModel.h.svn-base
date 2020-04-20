//
//  BaseViewModel.h
//  ScmProject
//
//  Created by zhoudong on 2018/7/9.
//  Copyright © 2018年 session. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id data);
typedef void(^FailBlock)(id data);

@interface BaseViewModel : NSObject
@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailBlock failBlock;

- (NSURLSessionTask*)loadDataWithSuccessBlock:(SuccessBlock)successBlock andFail:(FailBlock)failBlock;

@end
