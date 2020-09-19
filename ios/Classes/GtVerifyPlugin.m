#import "GtVerifyPlugin.h"
#import <GeYanSdk/GeYanSdk.h>
#import "GtNavUtils.h"
@implementation GtVerifyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"gt_verify"
            binaryMessenger:[registrar messenger]];
  GtVerifyPlugin* instance = [[GtVerifyPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
      
  } if ([@"startWithAppId" isEqualToString:call.method]) {
      NSString * appId = call.arguments[0];
      [GeYanSdk startWithAppId:appId withCallback:^(BOOL isSuccess, NSError * _Nullable error, NSString * _Nullable gyUid) {
          result(isSuccess ? gyUid : @"获取id失败");
      }];
      
  }if ([@"preGetToken" isEqualToString:call.method]) {
      
      [GeYanSdk preGetToken:^(NSDictionary * _Nullable verifyDictionary) {
          result(verifyDictionary);
      }];
  }if ([@"oneTapLogin" isEqualToString:call.method]) {
      if ([GeYanSdk isPreGettedTokenValidate]) {
          GyAuthViewModel * model = [[GyAuthViewModel alloc] init];
          [GeYanSdk oneTapLogin:[GtNavUtils currentVC] withViewModel:model andCallback:^(NSDictionary * _Nullable verifyDictionary) {
              result(verifyDictionary);
          }];
      }else {
          
      }
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
