 


#import "CreateAddressAndPrivate.h"
#import "ChainStyleModel.h"
@implementation CreateAddressAndPrivate{
    
    int count;
}


static CreateAddressAndPrivate *__onetimeClass;
/*
+(CreateAddressAndPrivate *)sharedCreateAddressAndPrivate
{
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        
        __onetimeClass = [[CreateAddressAndPrivate alloc]init];
        
    });
    
    return __onetimeClass;
}

//-(void)creatAddressFun:(UIView*)view{
//
//    NSDictionary*  walletDic=[Manager takeoutUserTokenkey:walletWorkKeyAndPass];
//    NSString* zjc=[AESCry decrypt:walletDic[walletWord]];
//    if (!walletDic)  return;
//    count  = 0;
//    [self creatEth:view zjcFun:zjc];
//}


-(void)creatEth:(UIView*)v zjcFun:(NSString*)zjcSTR{
   
    ChainStyleModel* chainStyleModel=[ChainListManager selectPrityKeyChain:ETHChainid];
    if(chainStyleModel.address==nil  || chainStyleModel.privatekey==nil){
        
        NSString* createAddressStr = [NSString stringWithFormat:@"createaddress(%@,'%@')",ETHChainid,zjcSTR];
        WeakSelf(self);
        
        [[CallJsClass OCCallJs] getAddressExecuFun:createAddressStr backResultBlock:^(id data) {
            NSDictionary* dict = [NSString dictionaryWithJsonString:data];
            if(dict){
                
                NSString* cAddress = AssectString(dict[@"address"]) ;
                NSString* cPublicKey = AssectString(dict[@"privateKey"]);
                [weakself updataAddressAndPrivatekey:ETHChainid withAddress:cAddress withPrivatekey:cPublicKey];
                [weakself getWorkCurrencyAssets:ETHChainid addressFun:cAddress];
            }else{
                  [weakself getWorkCurrencyAssets:ETHChainid addressFun:nil];
            }
            
            [weakself  creatBTC:v zjcFun:zjcSTR];
        } backFailBlock:^(id data) {
              [weakself getWorkCurrencyAssets:ETHChainid addressFun:nil];
              [weakself  creatBTC:v zjcFun:zjcSTR];
        } currencyName:PrivateKeyAndAddress
                          currentViewFun:v];
        
    }else{
         [self getWorkCurrencyAssets:ETHChainid addressFun:chainStyleModel.address];
         [self  creatBTC:v zjcFun:zjcSTR];
    }
}

-(void)creatBTC:(UIView*)v zjcFun:(NSString*)zjcSTR{
    
    ChainStyleModel* chainStyleModel=[ChainListManager selectPrityKeyChain:BTCChainid];
    if(chainStyleModel.address==nil  || chainStyleModel.privatekey==nil){
        
        NSString* createAddressStr = [NSString stringWithFormat:@"createaddress(%@,'%@')",BTCChainid,zjcSTR];
        WeakSelf(self);
        
        [[CallJsClass OCCallJs] getAddressExecuFun:createAddressStr backResultBlock:^(id data) {
            NSDictionary* dict = [NSString dictionaryWithJsonString:data];
            if(dict){
                
                NSString* cAddress = AssectString(dict[@"address"]) ;
                NSString* cPublicKey = AssectString(dict[@"privateKey"]);
                
                [weakself updataAddressAndPrivatekey:BTCChainid withAddress:cAddress withPrivatekey:cPublicKey];
                [weakself getWorkCurrencyAssets:BTCChainid addressFun:cAddress];
            }else{
                   [weakself getWorkCurrencyAssets:BTCChainid addressFun:nil];
            }
            
              [weakself  creatETP:v zjcFun:zjcSTR];
        } backFailBlock:^(id data) {
              [weakself getWorkCurrencyAssets:BTCChainid addressFun:nil];
               [weakself  creatETP:v zjcFun:zjcSTR];
        } currencyName:PrivateKeyAndAddress
                          currentViewFun:v];
        
    }else{
        [self getWorkCurrencyAssets:BTCChainid addressFun:chainStyleModel.address];
         [self  creatETP:v zjcFun:zjcSTR];
    }
}


-(void)creatETP:(UIView*)v zjcFun:(NSString*)zjcSTR{
    
    ChainStyleModel* chainStyleModel=[ChainListManager selectPrityKeyChain:ETPChainid];
    if(chainStyleModel.address==nil  || chainStyleModel.privatekey==nil){
        
        NSString* createAddressStr = [NSString stringWithFormat:@"createaddress(%@,'%@')",ETPChainid,zjcSTR];
        WeakSelf(self);
        
        [[CallJsClass OCCallJs] getAddressExecuFun:createAddressStr backResultBlock:^(id data) {
            NSDictionary* dict = [NSString dictionaryWithJsonString:data];
            if(dict){
                
                NSString* cAddress = AssectString(dict[@"address"]) ;
                NSString* cPublicKey = AssectString(dict[@"privateKey"]);
                
                [weakself updataAddressAndPrivatekey:ETPChainid withAddress:cAddress withPrivatekey:cPublicKey];
                [weakself getWorkCurrencyAssets:ETPChainid addressFun:cAddress];
            }else{
                  [weakself getWorkCurrencyAssets:ETPChainid addressFun:nil];
            }
            
             [weakself  creatVSYS:v zjcFun:zjcSTR];
        } backFailBlock:^(id data) {
              [weakself getWorkCurrencyAssets:ETPChainid addressFun:nil];
             [weakself  creatVSYS:v zjcFun:zjcSTR];
        } currencyName:PrivateKeyAndAddress
                          currentViewFun:v];
        
    }else{
        [self getWorkCurrencyAssets:ETPChainid addressFun:chainStyleModel.address];
         [self  creatVSYS:v zjcFun:zjcSTR];
    }
}


-(void)creatVSYS:(UIView*)v zjcFun:(NSString*)zjcSTR{
    
    ChainStyleModel* chainStyleModel=[ChainListManager selectPrityKeyChain:VEEChainid];
    if(chainStyleModel.address==nil  || chainStyleModel.privatekey==nil){
        
        NSString* createAddressStr = [NSString stringWithFormat:@"createaddress(%@,'%@')",VEEChainid,zjcSTR];
        WeakSelf(self);
        
        [[CallJsClass OCCallJs] getAddressExecuFun:createAddressStr backResultBlock:^(id data) {
            NSDictionary* dict = [NSString dictionaryWithJsonString:data];
            if(dict){
                
                NSString* cAddress = AssectString(dict[@"address"]) ;
                NSString* cPublicKey = AssectString(dict[@"privateKey"]);
                
                [weakself updataAddressAndPrivatekey:VEEChainid withAddress:cAddress withPrivatekey:cPublicKey];
                [weakself getWorkCurrencyAssets:VEEChainid addressFun:cAddress];
            }else{
                  [weakself getWorkCurrencyAssets:VEEChainid addressFun:nil];
            }
              [weakself  creatONT:v zjcFun:zjcSTR];
            
        } backFailBlock:^(id data) {
             [weakself getWorkCurrencyAssets:VEEChainid addressFun:nil];
              [weakself  creatONT:v zjcFun:zjcSTR];
        } currencyName:PrivateKeyAndAddress
                          currentViewFun:v];
        
    }else{
        [self getWorkCurrencyAssets:VEEChainid addressFun:chainStyleModel.address];
        [self  creatONT:v zjcFun:zjcSTR];
    }
}

-(void)creatONT:(UIView*)v zjcFun:(NSString*)zjcSTR{
    
    ChainStyleModel* chainStyleModel=[ChainListManager selectPrityKeyChain:ONTChainid];
    if(chainStyleModel.address==nil  || chainStyleModel.privatekey==nil){
        
        NSString* createAddressStr = [NSString stringWithFormat:@"createaddress(%@,'%@')",ONTChainid,zjcSTR];
        WeakSelf(self);
        
        [[CallJsClass OCCallJs] getAddressExecuFun:createAddressStr backResultBlock:^(id data) {
            NSDictionary* dict = [NSString dictionaryWithJsonString:data];
            if(dict){
                
                NSString* cAddress = AssectString(dict[@"address"]) ;
                NSString* cPublicKey = AssectString(dict[@"publicKey"]);
                
                [weakself updataAddressAndPrivatekey:ONTChainid withAddress:cAddress withPrivatekey:cPublicKey];
                [weakself getWorkCurrencyAssets:ONTChainid addressFun:cAddress];
            }else{
                  [weakself getWorkCurrencyAssets:ONTChainid addressFun:nil];
            }
            
            [weakself  creatWicc:v zjcFun:zjcSTR];
        } backFailBlock:^(id data) {
              [weakself getWorkCurrencyAssets:ONTChainid addressFun:nil];
             [weakself  creatWicc:v zjcFun:zjcSTR];
        } currencyName:PrivateKeyAndAddress
                          currentViewFun:v];
        
    }else{
        [self getWorkCurrencyAssets:ONTChainid addressFun:chainStyleModel.address];
        [self  creatWicc:v zjcFun:zjcSTR];
    }
}

-(void)creatWicc:(UIView*)v zjcFun:(NSString*)zjcSTR{
    
    ChainStyleModel* chainStyleModel=[ChainListManager selectPrityKeyChain:WICCChainid];
    if(chainStyleModel.address==nil  || chainStyleModel.privatekey==nil){
        
        NSString* createAddressStr = [NSString stringWithFormat:@"createaddress(%@,'%@')",WICCChainid, zjcSTR];
        WeakSelf(self);
        
        [[CallJsClass OCCallJs] getAddressExecuFun:createAddressStr backResultBlock:^(id data) {
            NSDictionary* dict = [NSString dictionaryWithJsonString:data];
            if(dict){
                
                NSString* cAddress = AssectString(dict[@"address"]) ;
                NSString* cPublicKey = AssectString(dict[@"privateKey"]);
                
                [weakself updataAddressAndPrivatekey:WICCChainid withAddress:cAddress withPrivatekey:cPublicKey];
                [weakself getWorkCurrencyAssets:WICCChainid addressFun:cAddress];
            }else{
                  [weakself getWorkCurrencyAssets:WICCChainid addressFun:nil];
            }
            
              [weakself  creatEtrueChain:v zjcFun:zjcSTR];
        } backFailBlock:^(id data) {
              [weakself getWorkCurrencyAssets:WICCChainid addressFun:nil];
              [weakself  creatEtrueChain:v zjcFun:zjcSTR];
        } currencyName:PrivateKeyAndAddress
                          currentViewFun:v];
        
    }else{
        [self getWorkCurrencyAssets:WICCChainid addressFun:chainStyleModel.address];
        
         [self  creatEtrueChain:v zjcFun:zjcSTR];
    }
}



-(void)creatEtrueChain:(UIView*)v zjcFun:(NSString*)zjcSTR{
   
    ChainStyleModel* chainStyleModel=[ChainListManager selectPrityKeyChain:TRUEChainid];
    if(chainStyleModel.address==nil  || chainStyleModel.privatekey==nil){
        
        NSString* createAddressStr = [NSString stringWithFormat:@"createaddress(%@,'%@')",ETHChainid,zjcSTR];
        WeakSelf(self);
        
        [[CallJsClass OCCallJs] getAddressExecuFun:createAddressStr backResultBlock:^(id data) {
            NSDictionary* dict = [NSString dictionaryWithJsonString:data];
            if(dict){
                
                NSString* cAddress = AssectString(dict[@"address"]) ;
                NSString* cPublicKey = AssectString(dict[@"privateKey"]);
                [weakself updataAddressAndPrivatekey:TRUEChainid withAddress:cAddress withPrivatekey:cPublicKey];
                [weakself getWorkCurrencyAssets:TRUEChainid addressFun:cAddress];
            }else{
                  [weakself getWorkCurrencyAssets:TRUEChainid addressFun:nil];
            }
            
            
        } backFailBlock:^(id data) {
              [weakself getWorkCurrencyAssets:TRUEChainid addressFun:nil];
              
        } currencyName:PrivateKeyAndAddress
                          currentViewFun:v];
        
    }else{
         [self getWorkCurrencyAssets:TRUEChainid addressFun:chainStyleModel.address];
    }
}

-(void)getWorkCurrencyAssets:(NSString*)chainID addressFun:(NSString*)address{
    //共链总数量
    NSInteger chainTotalNum = 7;
    
    
    //s地址生成失败count++
    if(address == nil){
        count ++;
        if(self.backData!= nil && count>=chainTotalNum)
            self.backData(@{@"chainId":chainID}, 1, nil);
        return;
    }
    
    NSString* url =@"";
    
    if([chainID isEqualToString:ETHChainid]){
        url = @"eth/asset";
    }
    else if([chainID isEqualToString:BTCChainid]){
        url = @"btc/asset";
    }else if([chainID isEqualToString:ETPChainid]){
        url = @"mvs/asset";
    }else if([chainID isEqualToString:VEEChainid]){
        url = @"vsys/asset";
    }else if([chainID isEqualToString:ONTChainid]){
        url = @"ont/asset";
    }else if([chainID isEqualToString:WICCChainid]){
        url = @"wicc/asset";
    }else if([chainID isEqualToString:TRUEChainid]){
        url = @"etrue/asset";
    }else{
        url = @"";
    }
    
    NSString* reqUrl = [NSString stringWithFormat:@"%@%@",Cloud_AllLibrary,url];
    WeakSelf(self);
    [[ZYNetTool defaultManager] postWithParams:@{@"address":address} url:reqUrl didsele:NO view:nil juhua:NO time:60 success:^(NSURLSessionDataTask *task, NSDictionary* json) {
         count++;
        if([json[@"data"] isKindOfClass:[NSArray class]])
              [weakself updateTheAsset:json[@"data"]];
        
        if(self.backData!= nil && count>=chainTotalNum)
            self.backData(@{@"chainId":chainID}, 1, nil);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        count++;
        if(self.backData!= nil && count>=chainTotalNum)
            self.backData(@{@"chainId":chainID}, 1, nil);
    }];
}




-(void)updateTheAsset:(NSArray*)assArray{
    
    @synchronized(self) {
        for (NSDictionary* p in assArray) {
            NSString* cid =  p[@"contractid"];
            NSString * balance = p[@"balance"];
            BiStyleModel *model  =  [CoinListManager selectToWithCoinid:cid];
            if(model != nil && model.price != nil){
                float vlue = [balance floatValue] * [model.price floatValue];
                NSString* string = [NSString stringWithFormat:@"%.4f",vlue];
                [CoinListManager updataTheAsset:cid coinNumber:balance assetVlue:string];
            }
        }
    }

}






-(void)updataAddressAndPrivatekey:(NSString*)chainID withAddress:(NSString*)address withPrivatekey:(NSString*)privatekey{
    
     [ChainListManager updataAddressAndPrivatekeyWithChain:chainID withAddress:address withPrivatekey:[AESCry encrypt:privatekey]];
}


*/

@end
