#import "DeviceInfoPlugin.h"
#if __has_include(<device_info/device_info-Swift.h>)
#import <device_info/device_info-Swift.h>
#else
#import "device_info-Swift.h"
#endif

@implementation DeviceInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceInfoPlugin registerWithRegistrar:registrar];
}
@end
