//
//  IPAddress.h
//  ScmProject
//
//  Created by zhoudong on 2018/7/7.
//  Copyright © 2018年 session. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IPAddress <NSObject>


#pragma mark - 服务器连接开关  1 测试服(t) 2 正式服(r)
//修改此处链接不同服务器  1 测试服务  2 正式服务器
#define SERVICE_LINK_FLAG 2


#if SERVICE_LINK_FLAG == 1

#define Cloud_PRO @"http://192.168.0.136:8031/bbq/"
//交易所
#define Cloud_Exchange @"http://192.168.1.136:8031/bbq/"

#endif

#if SERVICE_LINK_FLAG == 2
//http://quantking.io:9031/bbq/account/webSendCode
#define Cloud_PRO @"http://quantking.io:9031/bbq/"
//交易所
#define Cloud_Exchange @"http://quantking.io:9031/bbq/"


#endif

//完成注册
#define completeRegister @"account/register"
//验证码登录设置密码
#define insertLoginpass @"account/insertLoginpass"
//登录
#define  login @"account/login"
//验证码登录
#define phoneLogin @"account/phoneLogin"
//发送验证码
#define sendVerCode @"account/webSendCode"
//校验验证码
#define checkVerCode @"account/verification"
//忘记密码-校验验证码
#define forgetCheckVerCode @"account/forget"
//忘记密码-修改密码
#define forgetCompleteRegister @"account/checkForget"
//获取邮箱验证码
#define webSendEmail @"account/webSendEmail"
//绑定邮箱
#define bindingEmail @"account/bindingEmail"

//查询用户信息
#define  getAccountInfo @"account/getAccountInfo"

//个人中心的修改密码
#define  WKupdatepwd @"account/updatepwd"
//忘记密码-发送验证码
#define forgetSendVerCode @"account/forgetSendCode"

//设置交易密码
#define WKsetTransPwd @"assets/setTransPwd"

//修改交易密码
#define WKcheckTransPwd @"assets/checkTransPwd"

//修改交易密码
#define getUpdateVersion @"main/getVersion"

//矿多多 - 首页
#define getUserRecord @"assets/getUserRecord"
//矿多多 - 收矿
#define receiveMineral @"assets/collectITD"
//首页
#define mainpage @"information/mainpage"

//交易记录
#define  loadethrecord @"assets/loadethrecord"
//交易记录
#define  getAddress @"assets/getAddress"
//申请提币
#define  applyTransfer @"assets/applyTransfer"
//提币
#define  transferITD @"assets/transferITD"
//提币ITD
#define  transferOutITD @"assets/transferOutITD"
//充值时查资产
#define  getAssatInfo @"assets/getAssatInfo"
//付款
#define  sendTranstion @"assets/sendTranstion"

//消息中心
#define mainNotice @"main/notice"
//阅读消息
#define mainSetread @"main/setread"


//公投列表
#define getInvestment @"assets/getInvestment"
//公投资产
#define selectInvestment @"assets/selectInvestment"
//金额
#define selectInvestmentList @"assets/selectInvestmentList"
//期限
#define selectInvestmentDate @"assets/selectInvestmentDate"
//公投
#define setInvestment @"assets/setInvestment"
//公投详情
#define assetsGetdetail @"assets/getdetail"

//个人中心

#define WKlistAddress @"assets/listAddress" //地址列表

#define WKsetAddress @"assets/setAddress" //添加地址

#define WKdelAddress @"assets/delAddress" //删除地址

#define WKgetITDAccount @"assets/getITDAccount"  //账户

#define WKupdateHeader @"account/updateHeader" ///修稿头像

#define WKupdateNickName @"account/updateNickName"

#define getUserDetail @"assets/getUserDetail"

//实名认证
#define kcyVerification @"kcy/verification"
//高级认证
#define kcyVerificationtwo @"kcy/verificationtwo"

//判断用户输入的身份证号是否合法
#define realNameCertificate @"account/realNameCertificate"


//绑定手机号-发送验证码
#define sendBindPhone @"account/sendPhoneCode"
//绑定手机号-
#define bindVerPhone @"account/bindphone"

//c2c 挂单
#define addPayment @"c2c/addPayment"

//拉去挂单信息
#define getCoinInfoWhenPlaceOrder @"c2c/getCoinInfoWhenPlaceOrder"

//添加支付方式
#define addPayment @"c2c/addPayment"

//c2c 去挂单
#define c2ctransaction @"c2c/c2ctransaction"

//c2c订单记录
#define getOrderRecord @"c2c/getOrderRecord"

//c2c买单进入匹配详细界面
#define getOppoDetail @"c2c/getOppoDetail"

//c2c 申诉
#define appeal @"c2c/appeal"

//拉取法币账户币种信息
#define getExAssets @"c2c/getExAssets"
//otc资产列表
#define getC2cAssetsList @"c2c/getC2cAssetsList"
//币币资产记录
#define getC2cTransferRecord @"transfer/getC2cTransferRecord"
//查询账户资产余额
#define getUserAssetsYe @"transfer/getUserAssetsYe"
//资产转币币
#define assetsToC2c @"transfer/assetsToC2c"
//币币转资产
#define c2cToAssets @"transfer/c2cToAssets"
//收款记录
#define loadReciveRecord @"assets/loadReciveRecord"

//基金列表
#define getlist @"information/getlist"
//刷新折扣
#define flushInvestment @"assets/flushInvestment"

//积分任务
#define gettaskinfo @"task/gettaskinfo"
//兑换首页
#define selectexchange @"assets/selectexchange"
//可选兑换列表
#define selectExDetail @"assets/selectExDetail"
//兑换
#define exchangeQtt @"assets/exchangeQtt"
//兑换记录
#define selectExRecord @"assets/selectExRecord"
//兑换记录
#define selectExRecord @"assets/selectExRecord"

//qtt账户
#define getQTTAccount @"assets/getQTTAccount"

//钱包账户
#define getAssets @"assets/getAssets"

//我的理财
#define getInvestRecord @"assets/getInvestRecord"
//追加详情
#define getInvestDetail @"assets/getInvestDetail"
//交易明细
#define selectInvestState @"assets/selectInvestState"
//申请进度
#define selectInvestResult @"assets/selectInvestResult"
//申请进度
#define getfound @"information/getfound"
//赎回
#define redeeminvest @"assets/redeeminvest"
//赎回预算
#define selectbudget @"assets/selectbudget"

//我的理财
#define transferAsset @"assets/transferAsset"

//路演
#define getintroduce @"task/getintroduce"
@end
