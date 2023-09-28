# react-native-all-sensors

This package provides users access to all the 13 different sensors available in android mobile phones and also provides realtime sensor data. 
<br>
### Why this package? 
Because there is no other package that provides access to all the sensors in react native.
<br>
<br>
<br>
(Fingerprint and time delay for sensor parameter will be added in next update,
Ios support will be added soon.)

<br>

## Installation

```sh
npm i react-native-all-sensors
```
<br>

# Usage

```js

import {start,
        stop,
        isSensorAvailable,
        onSensorChanged,
        removeSensorListener,
        startNow,
        stopNow,
        } 
from 'react-native-all-sensors'

```
<br>


## Easy mode
```js
startNow('proximity', (data) => {
  //do something with data
})
//after work is done
stopNow('proximity')//stops sensor


/* ['proximity', 'light', 'accelerometer',
 'magneticField', 'gyroscope',  'gravity',
   'linearAcceleration', 'rotationVector', 
   'ambientTemperature', 'relativeHumidity', 
   'ambientTemperature', 'pressure', 'temperature',
    'orientaion']*/
    
```
<br>

## Detailed mode

```js

isSensorAvailable('proximity').then((available) => {
      if (available) {
        start('proximity').then(() => {
            //Do something after sensor started
          onSensorChanged('ProximityData', (data) => {
            //Handle promise with data
          })
        }
        )
      }
    })

    //after work is done 
    removeSensorListener('ProximityData')//stops listening
    stop('proximity')//sensor stops




```
## Available Sensors
<br>

"proximity",
 "light",
  "accelerometer",
   "magneticField",
    "gyroscope",
     "gravity",
      "linearAcceleration",
       "rotationVector",
        "ambientTemperature",
         "relativeHumidity",
          "ambientTemperature",
           "pressure",
            "temperature",
             "orientaion"
             <br>
            <br>
## Data
<br>
"ProximityData",
 "LightData",
  "AccelerometerData",
   "MagneticFieldData",
    "GyroscopeData",
     "GravityData",
      "LinearAccelerationData",
       "RotationVectorData",
        "AmbientTemperatureData",
         "RelativeHumidityData",
          "AmbientTemperatureData",
           "PressureData",
            "TemperatureData",
             "OrientaionData"
             <br>
                <br>
             
## Sample Code

```js
import {startNow,
        stopNow}from 'react-native-all-sensors'

const App = () => {
const [accelerometer, setAccelerometer] = useState({x:0,y:0,z:0})

  return (
    <View>
      <Text>Accelerometer: {accelerometer.x} {accelerometer.y} {accelerometer.z}</Text>
      <TouchableOpacity style={styles.stop} 
      onPress={() =>
        stopNow('accelerometer')
        }>
        <Text>STOP </Text>
        </TouchableOpacity>
      <TouchableOpacity style={styles.start} 
      onPress={() =>
        startNow('accelerometer', (data) => {
          setAccelerometer(data)
        })
        }>
        <Text>Start</Text>
        </TouchableOpacity>
    </View>
  )
}
```
Sample Demo App Could be found Here:
https://github.com/Saboten758/allsenz
## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
