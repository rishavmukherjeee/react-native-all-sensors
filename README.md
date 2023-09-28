# react-native-all-sensors

It provides users with all the sensors available in android mobile phones and also provides the data from the sensors in real time.

## Installation

```sh
npm i react-native-all-sensors
```

## Usage

```js

import {start,
        stop,
        isSensorAvailable,
        onSensorChanged} 
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
    stop('proximity')
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
import { StyleSheet, Text, View } from 'react-native'
import React,{useState,useEffect} from 'react'
import {start, stop, isSensorAvailable,onSensorChanged} from 'react-native-all-sensors'
const App = () => {
  const [proximity, setProximity] = useState(0)
  const [accelerometer, setAccelerometer] = useState({x:0,y:0,z:0})
  useEffect(() => {
    isSensorAvailable('proximity').then((available) => {
      if (available) {
        start('proximity').then(() => {
          console.log('Proximity sensor started')
          onSensorChanged('ProximityData', (data) => {
            setProximity(data)
          })
        }
        )
      }
    })
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
    })
    return () => {
      stop('proximity')
      stop('accelerometer')
    }
  }
  , [])


  return (
    <View>
      <Text>Proximity: {proximity}</Text>
      <Text>Accelerometer: {accelerometer.x} {accelerometer.y} {accelerometer.z}</Text>
    </View>
  )
}

export default App

const styles = StyleSheet.create({})
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
