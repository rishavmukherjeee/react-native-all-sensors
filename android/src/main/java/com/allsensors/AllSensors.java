package com.allsensors;

import androidx.annotation.NonNull;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

@ReactModule(name = AllSensors.NAME)
public class AllSensors extends ReactContextBaseJavaModule implements SensorEventListener {
  public static final String NAME = "AllSensors";
    
    private final ReactApplicationContext reactContext;
    private final SensorManager sensorManager;
    private final Sensor proximity;
    private final Sensor light;
    private final Sensor accelerometer;
    private final Sensor magneticField;
    private final Sensor gyroscope;
    private final Sensor gravity;
    private final Sensor linearAcceleration;
    private final Sensor rotationVector;
    private final Sensor ambientTemperature;
    private final Sensor relativeHumidity;
    private final Sensor pressure;
    private final Sensor temperature;
    private final Sensor orientation;



  public AllSensors(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
        this.sensorManager = (SensorManager) reactContext.getSystemService(Context.SENSOR_SERVICE);
        this.proximity = sensorManager.getDefaultSensor(Sensor.TYPE_PROXIMITY);
        this.light = sensorManager.getDefaultSensor(Sensor.TYPE_LIGHT);
        this.accelerometer = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        this.magneticField = sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD);
        this.gyroscope = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
        this.gravity = sensorManager.getDefaultSensor(Sensor.TYPE_GRAVITY);
        this.linearAcceleration = sensorManager.getDefaultSensor(Sensor.TYPE_LINEAR_ACCELERATION);
        this.rotationVector = sensorManager.getDefaultSensor(Sensor.TYPE_ROTATION_VECTOR);
        this.ambientTemperature = sensorManager.getDefaultSensor(Sensor.TYPE_AMBIENT_TEMPERATURE);
        this.relativeHumidity = sensorManager.getDefaultSensor(Sensor.TYPE_RELATIVE_HUMIDITY);
        this.pressure = sensorManager.getDefaultSensor(Sensor.TYPE_PRESSURE);
        this.temperature= sensorManager.getDefaultSensor(Sensor.TYPE_TEMPERATURE);
        this.orientation= sensorManager.getDefaultSensor(Sensor.TYPE_ORIENTATION);
          
    
  }

  @Override
  @NonNull
  public String getName() {
    return NAME;
  }
  

  @ReactMethod
  public void isSensorAvailable(String sensorType, Promise promise) {
        Sensor sensor;
        if (sensorType.equals("proximity")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_PROXIMITY);
        } else if (sensorType.equals("light")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_LIGHT);
        } else if (sensorType.equals("accelerometer")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        } else if (sensorType.equals("magneticField")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD);
        } else if (sensorType.equals("gyroscope")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
        } else if (sensorType.equals("gravity")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_GRAVITY);
        } else if (sensorType.equals("linearAcceleration")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_LINEAR_ACCELERATION);
        } else if (sensorType.equals("rotationVector")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_ROTATION_VECTOR);
        } else if (sensorType.equals("ambientTemperature")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_AMBIENT_TEMPERATURE);
        } else if (sensorType.equals("relativeHumidity")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_RELATIVE_HUMIDITY);
        } else if (sensorType.equals("pressure")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_PRESSURE);
        } else if (sensorType.equals("temperature")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_TEMPERATURE);
        } else if (sensorType.equals("orientation")) {
            sensor = sensorManager.getDefaultSensor(Sensor.TYPE_ORIENTATION);
        }else {
            promise.reject("Invalid sensor type: " + sensorType);
            return;
        }

        if (sensor != null) {
            promise.resolve(true);
        } else {
            promise.resolve(false);
        }
    }


   @ReactMethod
    public void start(String sensorType, Promise promise) {
    Sensor sensor;
    if (sensorType.equals("proximity")) {
        sensor = proximity;
    } else if (sensorType.equals("light")) {
        sensor = light;
    } else if (sensorType.equals("accelerometer")) {
        sensor = accelerometer;
    } else if (sensorType.equals("magneticField")) {
        sensor = magneticField;
    } else if (sensorType.equals("gyroscope")) {
        sensor = gyroscope;
    } else if (sensorType.equals("gravity")) {
        sensor = gravity;
    } else if (sensorType.equals("linearAcceleration")) {
        sensor = linearAcceleration;
    } else if (sensorType.equals("rotationVector")) {
        sensor = rotationVector;
    } else if (sensorType.equals("ambientTemperature")) {
        sensor = ambientTemperature;
    } else if (sensorType.equals("relativeHumidity")) {
        sensor = relativeHumidity;
    } else if (sensorType.equals("pressure")) {
        sensor = pressure;
    } else if (sensorType.equals("temperature")) {
        sensor = temperature;
    } else if (sensorType.equals("orientation")) {
        sensor = orientation;
    } else {
            promise.reject("Invalid sensor type: " + sensorType);
            return;
    }

     try {
        sensorManager.registerListener(this, sensor, SensorManager.SENSOR_DELAY_NORMAL);
        promise.resolve(true);
    } catch (Exception e) {
        promise.resolve(false);
    }
 }
    @ReactMethod
    public void stop(String sensorType , Promise promise) {
    Sensor sensor;
    if (sensorType.equals("proximity")) {
        sensor = proximity;
    } else if (sensorType.equals("light")) {
        sensor = light;
    } else if (sensorType.equals("accelerometer")) {
        sensor = accelerometer;
    } else if (sensorType.equals("magneticField")) {
        sensor = magneticField;
    } else if (sensorType.equals("gyroscope")) {
        sensor = gyroscope;
    } else if (sensorType.equals("gravity")) {
        sensor = gravity;
    } else if (sensorType.equals("linearAcceleration")) {
        sensor = linearAcceleration;
    } else if (sensorType.equals("rotationVector")) {
        sensor = rotationVector;
    } else if (sensorType.equals("ambientTemperature")) {
        sensor = ambientTemperature;
    } else if (sensorType.equals("relativeHumidity")) {
        sensor = relativeHumidity;
    } else if (sensorType.equals("pressure")) {
        sensor = pressure;
    } else if (sensorType.equals("temperature")) {
        sensor = temperature;
    } else if (sensorType.equals("orientation")) {
        sensor = orientation;
    } else {
            promise.reject("Invalid sensor type: " + sensorType);
            return;
    }
    try{
      sensorManager.unregisterListener(this, sensor);
      promise.resolve(true);
    } catch (Exception e) {
        promise.resolve(false);
    }
  }

    @ReactMethod
    public void addListener(String eventName) {
        // This method is required by the NativeEventEmitter, but you can leave it empty.
    }

    @ReactMethod
    public void removeListener(Integer count) {
        // This method is required by the NativeEventEmitter, but you can leave it empty.
    }

    @ReactMethod
    public void onSensorChanged(SensorEvent sensorEvent) {
        WritableMap map = Arguments.createMap();
         if (sensorEvent.sensor.getType() == Sensor.TYPE_PROXIMITY) {
            float distance = sensorEvent.values[0];
           reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("ProximityData", distance);
       } else if (sensorEvent.sensor.getType() == Sensor.TYPE_LIGHT) {
            float light = sensorEvent.values[0];
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("LightData", light);
        } else if (sensorEvent.sensor.getType() == Sensor.TYPE_ACCELEROMETER) {
            float x = sensorEvent.values[0];
            float y = sensorEvent.values[1];
            float z = sensorEvent.values[2];
            map.putDouble("x", x);
            map.putDouble("y", y);
            map.putDouble("z", z);
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("AccelerometerData", map);
        } else if (sensorEvent.sensor.getType() == Sensor.TYPE_MAGNETIC_FIELD) {
            float x = sensorEvent.values[0];
            float y = sensorEvent.values[1];
            float z = sensorEvent.values[2];
            map.putDouble("x", x);
            map.putDouble("y", y);
            map.putDouble("z", z);
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("MagneticFieldData", map);
        } else if (sensorEvent.sensor.getType() == Sensor.TYPE_GYROSCOPE) {
            float x = sensorEvent.values[0];
            float y = sensorEvent.values[1];
            float z = sensorEvent.values[2];
            map.putDouble("x", x);
            map.putDouble("y", y);
            map.putDouble("z", z);
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("GyroscopeData", map);
        } else if (sensorEvent.sensor.getType() == Sensor.TYPE_GRAVITY) {
            float x = sensorEvent.values[0];
            float y = sensorEvent.values[1];
            float z = sensorEvent.values[2];
            map.putDouble("x", x);
            map.putDouble("y", y);
            map.putDouble("z", z);
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("GravityData", map);
        } else if (sensorEvent.sensor.getType() == Sensor.TYPE_LINEAR_ACCELERATION) {
            float x = sensorEvent.values[0];
            float y = sensorEvent.values[1];
            float z = sensorEvent.values[2];
            map.putDouble("x", x);
            map.putDouble("y", y);
            map.putDouble("z", z);
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("LinearAccelerationData", map);
        } else if (sensorEvent.sensor.getType() == Sensor.TYPE_ROTATION_VECTOR) {
            float x = sensorEvent.values[0];
            float y = sensorEvent.values[1];
            float z = sensorEvent.values[2];
            map.putDouble("x", x);
            map.putDouble("y", y);
            map.putDouble("z", z);
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("RotationVectorData", map);
        } else if (sensorEvent.sensor.getType() == Sensor.TYPE_AMBIENT_TEMPERATURE) {
            float ambientTemperature = sensorEvent.values[0];
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("AmbientTemperatureData", ambientTemperature);
        } else if (sensorEvent.sensor.getType() == Sensor.TYPE_RELATIVE_HUMIDITY) {
            float relativeHumidity = sensorEvent.values[0];
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("RelativeHumidityData", relativeHumidity);
        } else if (sensorEvent.sensor.getType() == Sensor.TYPE_PRESSURE) {
            float pressure = sensorEvent.values[0];
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("PressureData", pressure);
        } else if (sensorEvent.sensor.getType() == Sensor.TYPE_TEMPERATURE) {
            float temperature = sensorEvent.values[0];
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("TemperatureData", temperature);
        } else if (sensorEvent.sensor.getType() == Sensor.TYPE_ORIENTATION) {
            float orientation = sensorEvent.values[0];
            reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("OrientationData", orientation);
        }
    }
    
        @Override
      public void onAccuracyChanged(Sensor sensor, int accuracy) {
          // Handle accuracy change
      }



    
  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  
}
