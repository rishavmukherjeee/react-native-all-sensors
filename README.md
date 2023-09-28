# react-native-all-sensors

It provides users with all the 13 sensors available in android mobile phones and also provides the data from the sensors in real time. 
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
import { StyleSheet, Text, TouchableHighlight, TouchableOpacity, View } from 'react-native'
import React,{useState,useEffect} from 'react'
import {start, stop, isSensorAvailable,onSensorChanged,removeSensorListener} from 'react-native-all-sensors'
const App = () => {
  const [proximity, setProximity] = useState(0)
  const [light, setLight] = useState(0)
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
      else{
        console.log("no proximity:<")
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
      else{
        console.log("no accelerometer:<")
      }
    })

    isSensorAvailable('light').then((available) => {
      if (available) {
        start('light').then(() => {
          console.log('Light sensor started')
          onSensorChanged('LightData', (data) => {
            setLight(data)
          })
        }
        )
      }
      else{
        console.log("no light:<")
      }
    })
  }
  , [])

  const stopAccelerometer = () => {
    removeSensorListener('AccelerometerData')
    stop('accelerometer')
  }
  const startAccelerometer = () => {
    start('accelerometer')
    onSensorChanged('AccelerometerData', (data) => {
      setAccelerometer(data)
    })
  }
  return (
    <View>
      <Text>Proximity: {proximity}</Text>
      <Text>Accelerometer: {accelerometer.x} {accelerometer.y} {accelerometer.z}</Text>
      <Text>Light: {light}</Text>
      <TouchableOpacity style={styles.stop} onPress={stopAccelerometer}><Text>Stop Accelerometer</Text></TouchableOpacity>
      <TouchableOpacity style={styles.start} onPress={startAccelerometer}><Text>Start Accelerometer</Text></TouchableOpacity>
    </View>
  )
}

export default App

const styles = StyleSheet.create({
  stop:{
    backgroundColor:'red',
    color:'white',
    fontStyle:'bold',
    width:50,
    height:50,
    margin:100,
    justifyContent:'center',
    alignItems:'center'
  },
  start:{
    backgroundColor:'green',
    color:'white',
    fontStyle:'bold',
    width:50,
    height:50,
    marginLeft:100,
    justifyContent:'center',
    alignItems:'center'
  }
})
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
