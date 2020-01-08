# pixel-tracking-ios
Pixel Tracking module for iOS

## Requirement 
- iOS 8+ & Xcode 11
- Zalo SDK core lib v2.4.0912+
- AdSupport.framework

## Install
- Add to Podfile
```ruby
pod 'ZaloSDK/Pixel'
```
- Or use prebuilt framework [here](https://github.com/VNG-Zalo/ZaloSDK-iOS/tree/master/ZaloSDK/Frameworks/ZPTracker.framework)
- Add link to AdSupport.framework

## Usage
```ObjC
long long pixelId = 1L;
NSString *event = @"buy";

NSMutableDictionary *params = [NSMutableDictionary dictionary];
params[@"brand"] = @"apple";
params[@"model"] = @"iphone5";

ZPTracker *tracker = [ZPTracker newInstanceWithPixelId:pixelId];
[tracker trackEventWithName:event params:params];
```