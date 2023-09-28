
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNAllSensorsSpec.h"

@interface AllSensors : NSObject <NativeAllSensorsSpec>
#else
#import <React/RCTBridgeModule.h>

@interface AllSensors : NSObject <RCTBridgeModule>
#endif

@end
