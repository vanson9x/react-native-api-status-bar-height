#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ApiStatusBarHeight, NSObject)

RCT_EXTERN_METHOD(getStatusBarHeight:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

@end
