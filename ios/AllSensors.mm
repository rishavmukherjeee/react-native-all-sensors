#import "AllSensors.h"
#import <CoreMotion/CoreMotion.h>

@implementation AllSensors
{
    CMMotionManager *_motionManager;
    NSOperationQueue *_queue;
}

RCT_EXPORT_MODULE();

- (instancetype)init
{
    if (self = [super init]) {
        _motionManager = [[CMMotionManager alloc] init];
        _queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"ProximityData", @"LightData", @"AccelerometerData", @"MagneticFieldData", @"GyroscopeData", @"GravityData", @"LinearAccelerationData", @"RotationVectorData", @"AmbientTemperatureData", @"RelativeHumidityData", @"PressureData", @"TemperatureData", @"OrientationData"];
}

RCT_EXPORT_METHOD(start:(NSString *)sensorType)
{
    if ([sensorType isEqualToString:@"proximity"]) {
        // Start proximity sensor
        if (_motionManager.proximityAvailable) {
            [_motionManager setProximityUpdateInterval:0.1]; // Set your desired interval
            [_motionManager startProximityUpdates];
        }
    } else if ([sensorType isEqualToString:@"light"]) {
        // Start light sensor (if available)
        if (_motionManager.ambientLightAvailable) {
            [_motionManager setAmbientUpdateInterval:0.1]; // Set your desired interval
            [_motionManager startAmbientLightUpdates];
        }
    } else if ([sensorType isEqualToString:@"accelerometer"]) {
        // Start accelerometer
        if (_motionManager.accelerometerAvailable) {
            _motionManager.accelerometerUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startAccelerometerUpdatesToQueue:_queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                if (!error) {
                    [self sendEventWithName:@"AccelerometerData" body:@{@"x": @(accelerometerData.acceleration.x), @"y": @(accelerometerData.acceleration.y), @"z": @(accelerometerData.acceleration.z)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"magneticField"]) {
        // Start magnetometer
        if (_motionManager.magnetometerAvailable) {
            _motionManager.magnetometerUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startMagnetometerUpdatesToQueue:_queue withHandler:^(CMMagnetometerData *magnetometerData, NSError *error) {
                if (!error) {
                    [self sendEventWithName:@"MagneticFieldData" body:@{@"x": @(magnetometerData.magneticField.x), @"y": @(magnetometerData.magneticField.y), @"z": @(magnetometerData.magneticField.z)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"gyroscope"]) {
        // Start gyroscope
        if (_motionManager.gyroAvailable) {
            _motionManager.gyroUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startGyroUpdatesToQueue:_queue withHandler:^(CMGyroData *gyroData, NSError *error) {
                if (!error) {
                    [self sendEventWithName:@"GyroscopeData" body:@{@"x": @(gyroData.rotationRate.x), @"y": @(gyroData.rotationRate.y), @"z": @(gyroData.rotationRate.z)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"gravity"]) {
        // Start gravity
        if (_motionManager.deviceMotionAvailable) {
            _motionManager.deviceMotionUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startDeviceMotionUpdatesToQueue:_queue withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
                if (!error) {
                    [self sendEventWithName:@"GravityData" body:@{@"x": @(deviceMotion.gravity.x), @"y": @(deviceMotion.gravity.y), @"z": @(deviceMotion.gravity.z)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"linearAcceleration"]) {
        // Start linear acceleration
        if (_motionManager.deviceMotionAvailable) {
            _motionManager.deviceMotionUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startDeviceMotionUpdatesToQueue:_queue withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
                if (!error) {
                    [self sendEventWithName:@"LinearAccelerationData" body:@{@"x": @(deviceMotion.userAcceleration.x), @"y": @(deviceMotion.userAcceleration.y), @"z": @(deviceMotion.userAcceleration.z)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"rotationVector"]) {
        // Start rotation vector
        if (_motionManager.deviceMotionAvailable) {
            _motionManager.deviceMotionUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startDeviceMotionUpdatesToQueue:_queue withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
                if (!error) {
                    [self sendEventWithName:@"RotationVectorData" body:@{@"x": @(deviceMotion.attitude.quaternion.x), @"y": @(deviceMotion.attitude.quaternion.y), @"z": @(deviceMotion.attitude.quaternion.z), @"w": @(deviceMotion.attitude.quaternion.w)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"ambientTemperature"]) {
        // Start ambient temperature
        if (_motionManager.ambientTemperatureAvailable) {
            _motionManager.ambientTemperatureUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startAmbientTemperatureUpdates];
        }
    } else if ([sensorType isEqualToString:@"relativeHumidity"]) {
        // Start relative humidity
        if (_motionManager.relativeHumidityAvailable) {
            _motionManager.relativeHumidityUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startRelativeHumidityUpdates];
        }
    } else if ([sensorType isEqualToString:@"pressure"]) {
        // Start pressure
        if (_motionManager.pressureAvailable) {
            _motionManager.pressureUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startPressureUpdates];
        }
    } else if ([sensorType isEqualToString:@"temperature"]) {
        // Start temperature
        if (_motionManager.deviceMotionAvailable) {
            _motionManager.deviceMotionUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startDeviceMotionUpdatesToQueue:_queue withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
                if (!error) {
                    [self sendEventWithName:@"TemperatureData" body:@{@"temperature": @(deviceMotion.attitude.temperature)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"orientation"]) {
        // Start orientation
        if (_motionManager.deviceMotionAvailable) {
            _motionManager.deviceMotionUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startDeviceMotionUpdatesToQueue:_queue withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
                if (!error) {
                    [self sendEventWithName:@"OrientationData" body:@{@"x": @(deviceMotion.attitude.roll), @"y": @(deviceMotion.attitude.pitch), @"z": @(deviceMotion.attitude.yaw)}];
                }
            }];
        }
    }
}


RCT_EXPORT_METHOD(stop:(NSString *)sensorType)
{
    if ([sensorType isEqualToString:@"proximity"]) {
        // Stop proximity sensor
        [_motionManager stopProximityUpdates];
    } else if ([sensorType isEqualToString:@"light"]) {
        // Stop light sensor
        [_motionManager stopAmbientLightUpdates];
    } else if ([sensorType isEqualToString:@"accelerometer"]) {
        // Stop accelerometer
        [_motionManager stopAccelerometerUpdates];
    } else if ([sensorType isEqualToString:@"magneticField"]) {
        // Stop magnetometer
        [_motionManager stopMagnetometerUpdates];
    } else if ([sensorType isEqualToString:@"gyroscope"]) {
        // Stop gyroscope
        [_motionManager stopGyroUpdates];
    } else if ([sensorType isEqualToString:@"gravity"]) {
        // Stop gravity
        [_motionManager stopDeviceMotionUpdates];
    } else if ([sensorType isEqualToString:@"linearAcceleration"]) {
        // Stop linear acceleration
        [_motionManager stopDeviceMotionUpdates];
    } else if ([sensorType isEqualToString:@"rotationVector"]) {
        // Stop rotation vector
        [_motionManager stopDeviceMotionUpdates];
    } else if ([sensorType isEqualToString:@"ambientTemperature"]) {
        // Stop ambient temperature
        [_motionManager stopAmbientTemperatureUpdates];
    } else if ([sensorType isEqualToString:@"relativeHumidity"]) {
        // Stop relative humidity
        [_motionManager stopRelativeHumidityUpdates];
    } else if ([sensorType isEqualToString:@"pressure"]) {
        // Stop pressure
        [_motionManager stopPressureUpdates];
    } else if ([sensorType isEqualToString:@"temperature"]) {
        // Stop temperature
        [_motionManager stopDeviceMotionUpdates];
    } else if ([sensorType isEqualToString:@"orientation"]) {
        // Stop orientation
        [_motionManager stopDeviceMotionUpdates];
    }
}

RCT_EXPORT_METHOD(isSensorAvailable:(NSString *)sensorType resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    BOOL isAvailable = NO;
    
    if ([sensorType isEqualToString:@"proximity"]) {
        isAvailable = _motionManager.proximityAvailable;
    } else if ([sensorType isEqualToString:@"light"]) {
        isAvailable = _motionManager.ambientLightAvailable;
    } else if ([sensorType isEqualToString:@"accelerometer"]) {
        isAvailable = _motionManager.accelerometerAvailable;
    } else if ([sensorType isEqualToString:@"magneticField"]) {
        isAvailable = _motionManager.magnetometerAvailable;
    } else if ([sensorType isEqualToString:@"gyroscope"]) {
        isAvailable = _motionManager.gyroAvailable;
    } else if ([sensorType isEqualToString:@"gravity"]) {
        isAvailable = _motionManager.deviceMotionAvailable;
    } else if ([sensorType isEqualToString:@"linearAcceleration"]) {
        isAvailable = _motionManager.deviceMotionAvailable;
    } else if ([sensorType isEqualToString:@"rotationVector"]) {
        isAvailable = _motionManager.deviceMotionAvailable;
    } else if ([sensorType isEqualToString:@"ambientTemperature"]) {
        isAvailable = _motionManager.ambientTemperatureAvailable;
    } else if ([sensorType isEqualToString:@"relativeHumidity"]) {
        isAvailable = _motionManager.relativeHumidityAvailable;
    } else if ([sensorType isEqualToString:@"pressure"]) {
        isAvailable = _motionManager.pressureAvailable;
    } else if ([sensorType isEqualToString:@"temperature"]) {
        isAvailable = _motionManager.deviceMotionAvailable;
    } else if ([sensorType isEqualToString:@"orientation"]) {
        isAvailable = _motionManager.deviceMotionAvailable;
    } else {
        reject(@"sensor_not_available", @"Sensor not available", nil);
    }
}
RCT_EXPORT_METHOD(onSensorChanged:(NSString *)sensorType)
{
    if ([sensorType isEqualToString:@"proximity"]) {
        // Handle proximity sensor data and send it to JavaScript
        if (_motionManager.proximityAvailable) {
            [_motionManager setProximityUpdateInterval:0.1]; // Set your desired interval
            [_motionManager startProximityUpdates];
            [_motionManager setProximityUpdateHandler:^(CMProximityState state) {
                [self sendSensorData:@"ProximityData" withData:@{@"value": @(state)}];
            }];
        }
    } else if ([sensorType isEqualToString:@"light"]) {
        // Handle light sensor data and send it to JavaScript
        if (_motionManager.ambientLightAvailable) {
            [_motionManager setAmbientUpdateInterval:0.1]; // Set your desired interval
            [_motionManager startAmbientLightUpdates];
            [_motionManager setAmbientUpdateHandler:^(CMAmbientLightSample *lightData, NSError *error) {
                if (!error) {
                    [self sendSensorData:@"LightData" withData:@{@"lux": @(lightData.lux)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"accelerometer"]) {
        // Handle accelerometer data and send it to JavaScript
        if (_motionManager.accelerometerAvailable) {
            _motionManager.accelerometerUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startAccelerometerUpdatesToQueue:_queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                if (!error) {
                    [self sendSensorData:@"AccelerometerData" withData:@{@"x": @(accelerometerData.acceleration.x), @"y": @(accelerometerData.acceleration.y), @"z": @(accelerometerData.acceleration.z)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"magneticField"]) {
        // Handle magnetometer data and send it to JavaScript
        if (_motionManager.magnetometerAvailable) {
            _motionManager.magnetometerUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startMagnetometerUpdatesToQueue:_queue withHandler:^(CMMagnetometerData *magnetometerData, NSError *error) {
                if (!error) {
                    [self sendSensorData:@"MagneticFieldData" withData:@{@"x": @(magnetometerData.magneticField.x), @"y": @(magnetometerData.magneticField.y), @"z": @(magnetometerData.magneticField.z)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"gyroscope"]) {
        // Handle gyroscope data and send it to JavaScript
        if (_motionManager.gyroAvailable) {
            _motionManager.gyroUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startGyroUpdatesToQueue:_queue withHandler:^(CMGyroData *gyroData, NSError *error) {
                if (!error) {
                    [self sendSensorData:@"GyroscopeData" withData:@{@"x": @(gyroData.rotationRate.x), @"y": @(gyroData.rotationRate.y), @"z": @(gyroData.rotationRate.z)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"gravity"]) {
        // Handle gravity data and send it to JavaScript
        if (_motionManager.deviceMotionAvailable) {
            _motionManager.deviceMotionUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startDeviceMotionUpdatesToQueue:_queue withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
                if (!error) {
                    [self sendSensorData:@"GravityData" withData:@{@"x": @(deviceMotion.gravity.x), @"y": @(deviceMotion.gravity.y), @"z": @(deviceMotion.gravity.z)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"linearAcceleration"]) {
        // Handle linear acceleration data and send it to JavaScript
        if (_motionManager.deviceMotionAvailable) {
            _motionManager.deviceMotionUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startDeviceMotionUpdatesToQueue:_queue withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
                if (!error) {
                    [self sendSensorData:@"LinearAccelerationData" withData:@{@"x": @(deviceMotion.userAcceleration.x), @"y": @(deviceMotion.userAcceleration.y), @"z": @(deviceMotion.userAcceleration.z)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"rotationVector"]) {
        // Handle rotation vector data and send it to JavaScript
        if (_motionManager.deviceMotionAvailable) {
            _motionManager.deviceMotionUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startDeviceMotionUpdatesToQueue:_queue withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
                if (!error) {
                    [self sendSensorData:@"RotationVectorData" withData:@{@"x": @(deviceMotion.attitude.quaternion.x), @"y": @(deviceMotion.attitude.quaternion.y), @"z": @(deviceMotion.attitude.quaternion.z), @"w": @(deviceMotion.attitude.quaternion.w)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"ambientTemperature"]) {
        // Handle ambient temperature data and send it to JavaScript
        if (_motionManager.ambientTemperatureAvailable) {
            _motionManager.ambientTemperatureUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startAmbientTemperatureUpdates];
            [_motionManager setAmbientTemperatureUpdateHandler:^(CMAmbientTemperatureData *temperatureData, NSError *error) {
                if (!error) {
                    [self sendSensorData:@"AmbientTemperatureData" withData:@{@"temperature": @(temperatureData.temperature)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"relativeHumidity"]) {
        // Handle relative humidity data and send it to JavaScript
        if (_motionManager.relativeHumidityAvailable) {
            _motionManager.relativeHumidityUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startRelativeHumidityUpdates];
            [_motionManager setRelativeHumidityUpdateHandler:^(CMRelativeHumidityData *humidityData, NSError *error) {
                if (!error) {
                    [self sendSensorData:@"RelativeHumidityData" withData:@{@"humidity": @(humidityData.relativeHumidity)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"pressure"]) {
        // Handle pressure data and send it to JavaScript
        if (_motionManager.pressureAvailable) {
            _motionManager.pressureUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startPressureUpdates];
            [_motionManager setPressureUpdateHandler:^(CMPressureData *pressureData, NSError *error) {
                if (!error) {
                    [self sendSensorData
                        :@"PressureData" withData:@{@"pressure": @(pressureData.pressure)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"temperature"]) {
        // Handle temperature data and send it to JavaScript
        if (_motionManager.deviceMotionAvailable) {
            _motionManager.deviceMotionUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startDeviceMotionUpdatesToQueue:_queue withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
                if (!error) {
                    [self sendSensorData:@"TemperatureData" withData:@{@"temperature": @(deviceMotion.attitude.temperature)}];
                }
            }];
        }
    } else if ([sensorType isEqualToString:@"orientation"]) {
        // Handle orientation data and send it to JavaScript
        if (_motionManager.deviceMotionAvailable) {
            _motionManager.deviceMotionUpdateInterval = 0.1; // Set your desired interval
            [_motionManager startDeviceMotionUpdatesToQueue:_queue withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
                if (!error) {
                    [self sendSensorData:@"OrientationData" withData:@{@"x": @(deviceMotion.attitude.roll), @"y": @(deviceMotion.attitude.pitch), @"z": @(deviceMotion.attitude.yaw)}];
                }
            }];
        }
    }
}

RCT_EXPORT_METHOD(removeSensorListener:(NSString *)sensorType)
{
    if ([sensorType isEqualToString:@"proximity"]) {
        // Remove proximity sensor listener
        [self removeAllListeners:@"ProximityData"];
    } else if ([sensorType isEqualToString:@"light"]) {
        // Remove light sensor listener
        [self removeAllListeners:@"LightData"];
    } else if ([sensorType isEqualToString:@"accelerometer"]) {
        // Remove accelerometer sensor listener
        [self removeAllListeners:@"AccelerometerData"];
    } else if ([sensorType isEqualToString:@"magneticField"]) {
        // Remove magnetic field sensor listener
        [self removeAllListeners:@"MagneticFieldData"];
    } else if ([sensorType isEqualToString:@"gyroscope"]) {
        // Remove gyroscope sensor listener
        [self removeAllListeners:@"GyroscopeData"];
    } else if ([sensorType isEqualToString:@"gravity"]) {
        // Remove gravity sensor listener
        [self removeAllListeners:@"GravityData"];
    } else if ([sensorType isEqualToString:@"linearAcceleration"]) {
        // Remove linear acceleration sensor listener
        [self removeAllListeners:@"LinearAccelerationData"];
    } else if ([sensorType isEqualToString:@"rotationVector"]) {
        // Remove rotation vector sensor listener
        [self removeAllListeners:@"RotationVectorData"];
    } else if ([sensorType isEqualToString:@"ambientTemperature"]) {
        // Remove ambient temperature sensor listener
        [self removeAllListeners:@"AmbientTemperatureData"];
    } else if ([sensorType isEqualToString:@"relativeHumidity"]) {
        // Remove relative humidity sensor listener
        [self removeAllListeners:@"RelativeHumidityData"];
    } else if ([sensorType isEqualToString:@"pressure"]) {
        // Remove pressure sensor listener
        [self removeAllListeners:@"PressureData"];
    } else if ([sensorType isEqualToString:@"temperature"]) {
        // Remove temperature sensor listener
        [self removeAllListeners:@"TemperatureData"];
    } else if ([sensorType isEqualToString:@"orientation"]) {
        // Remove orientation sensor listener
        [self removeAllListeners:@"OrientationData"];
    }
}


@end
