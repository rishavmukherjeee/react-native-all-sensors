# react-native-all-sensors

This package provides users access to all the 13 different sensors available in android mobile phones and also provides realtime sensor data. 
<br><br>
(Fingerprint and time delay for sensor parameter will be added in next update,
Ios support will be added soon.)


## Installation

```sh
npm i react-native-all-sensors
```

## Usage

```js

import {start,
        stop,
        isSensorAvailable,
        onSensorChanged,
        removeSensorListener
        } 
from 'react-native-all-sensors'

/* ['proximity', 'light', 'accelerometer',
 'magneticField', 'gyroscope',  'gravity',
   'linearAcceleration', 'rotationVector', 
   'ambientTemperature', 'relativeHumidity', 
   'ambientTemperature', 'pressure', 'temperature',
    'orientaion']*/




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
## Data
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
## Sample Code
```js
import {  start, 
          stop, 
          isSensorAvailable,
          onSensorChanged,
          removeSensorListener } from 'react-native-all-sensors'

const AllSensors = () => {
  const [accelerometer, setAccelerometer] = useState({x:0,y:0,z:0})
  useEffect(() => {
    isSensorAvailable('accelerometer').then((available) => {
      if (available) {
        start('accelerometer').then(() => {
          console.log('Accelerometer sensor started')
          onSensorChanged('AccelerometerData', (data) => {
            setAccelerometer(data)
          })
        }
        )
      }
      else{
        console.log("no accel:<")
      }
    })
  }
  , [])
  return (
    <View>
      <Text>Accelerometer: {accelerometer.x} {accelerometer.y} {accelerometer.z}</Text>
    </View>
  )
}
export default AllSensors
```
Sample Demo App Could be found Here:
https://github.com/Saboten758/allsenz
## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
