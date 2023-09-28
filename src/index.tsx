import { NativeModules, Platform,DeviceEventEmitter  } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-all-sensors' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const AllSensors = NativeModules.AllSensors
  ? NativeModules.AllSensors
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );


    export function start(sensorName: string): Promise<boolean> {
      if (Platform.OS === 'android') {
        return AllSensors.start(sensorName);
      } else {
        return Promise.reject("Starting sensors is not supported on iOS");
      }
    }
    
    export function stop(sensorName: string): Promise<boolean> {
      if (Platform.OS === 'android') {
        return AllSensors.stop(sensorName);
      } else {
        return Promise.reject("Stopping sensors is not supported on iOS");
      }
    }
    
    export function isSensorAvailable(sensorName: string): Promise<boolean> {
      if (Platform.OS === 'android') {
        return AllSensors.isSensorAvailable(sensorName);
      } else {
        return Promise.reject("Checking sensor availability is not supported on iOS");
      }
    }
    
    export function onSensorChanged(sensorName: string, listener: (data: any) => void): void {
      if (Platform.OS === 'android') {
        DeviceEventEmitter.addListener(sensorName, (eventData) => {
          listener(eventData);
        });
      } else {
        throw new Error("Listening to sensor changes is not supported on iOS");
      }
    }
    
    
    export function removeSensorListener(sensorName: string, listener: (data: any) => void): void {
      if (Platform.OS === 'android') {
        DeviceEventEmitter.removeListener(sensorName, listener);
      } else {
        throw new Error("Removing sensor listeners is not supported on iOS");
      }
    }
    