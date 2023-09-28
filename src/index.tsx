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
function capitalizeAndAddData(inputString:String) {
  if (typeof inputString !== 'string' || inputString.length === 0) {
    return 'InvalidInputData'; }
    
  const capitalizedString = inputString.charAt(0).toUpperCase() + inputString.slice(1);

  return capitalizedString + 'Data';
}

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
    
    
    export function removeSensorListener(sensorName: string): void {
      if (Platform.OS === 'android') {
        DeviceEventEmitter.removeAllListeners(sensorName);
      } else {
        throw new Error("Removing sensor listeners is not supported on iOS");
      }
    }
    export function startNow(sensorName: string, listener: (data: any) => void): Promise<boolean> {
      return start(sensorName)
        .then(() => {
          onSensorChanged(capitalizeAndAddData(sensorName), listener);
          return true;
        })
        .catch((error) => {
          console.error("Error starting sensor:", error);
          return false;
        });
    }

    export function stopNow(sensorName: string): Promise<boolean> {
      return stop(sensorName)
        .then(() => {
          removeSensorListener(sensorName);
          return true;
        })
        .catch((error) => {
          console.error("Error stopping sensor:", error);
          return false;
        });
    }