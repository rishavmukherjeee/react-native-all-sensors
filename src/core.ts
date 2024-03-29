import { DeviceEventEmitter, NativeModules, Platform } from 'react-native';
import { LINKING_ERROR } from './errors';
import type { ListenerNameType, SensorNameType } from './types';

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

function capitalizeAndAddData(sensorName: SensorNameType): ListenerNameType {
  const capitalizedString =
    sensorName.charAt(0).toUpperCase() + sensorName.slice(1);

  return (capitalizedString + 'Data') as ListenerNameType;
}

export function start(sensorName: SensorNameType): Promise<boolean> {
  if (Platform.OS === 'android') {
    return AllSensors.start(sensorName);
  } else {
    return Promise.reject('Starting sensors is not supported on iOS');
  }
}

export function stop(sensorName: SensorNameType): Promise<boolean> {
  if (Platform.OS === 'android') {
    return AllSensors.stop(sensorName);
  } else {
    return Promise.reject('Stopping sensors is not supported on iOS');
  }
}

export function isSensorAvailable(
  sensorName: SensorNameType
): Promise<boolean> {
  if (Platform.OS === 'android') {
    return AllSensors.isSensorAvailable(sensorName);
  } else {
    return Promise.reject(
      'Checking sensor availability is not supported on iOS'
    );
  }
}

export function onSensorChanged(
  listenerName: ListenerNameType,
  listener: (data: any) => void
): void {
  if (Platform.OS === 'android') {
    DeviceEventEmitter.addListener(listenerName, (eventData) => {
      listener(eventData);
    });
  } else {
    throw new Error('Listening to sensor changes is not supported on iOS');
  }
}

export function removeSensorListener(sensorName: SensorNameType): void {
  if (Platform.OS === 'android') {
    DeviceEventEmitter.removeAllListeners(sensorName);
  } else {
    throw new Error('Removing sensor listeners is not supported on iOS');
  }
}

export function startNow(
  sensorName: SensorNameType,
  listener: (data: any) => void
): Promise<boolean> {
  return start(sensorName)
    .then(() => {
      onSensorChanged(capitalizeAndAddData(sensorName), listener);
      return true;
    })
    .catch((error) => {
      console.error('Error starting sensor:', error);
      return false;
    });
}

export function stopNow(sensorName: SensorNameType): Promise<boolean> {
  return stop(sensorName)
    .then(() => {
      removeSensorListener(sensorName);
      return true;
    })
    .catch((error) => {
      console.error('Error stopping sensor:', error);
      return false;
    });
}
