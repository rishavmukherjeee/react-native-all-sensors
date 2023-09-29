import { StyleSheet, Text, TouchableOpacity, View } from 'react-native'
import React,{useState} from 'react'
import {startNow,stopNow} from 'react-native-all-sensors'
const App = () => {

  const [accelerometer, setAccelerometer] = useState({x:0,y:0,z:0})
  const [gyroscope, setGyroscope] = useState({x:0,y:0,z:0})
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
        <Text>Gyroscope: {gyroscope.x} {gyroscope.y} {gyroscope.z}</Text>
      <TouchableOpacity style={styles.stop}
      onPress={() =>
        stopNow('gyroscope')
        }>
        <Text>STOP </Text>
        </TouchableOpacity>
      <TouchableOpacity style={styles.start}
      onPress={() =>
        startNow('gyroscope', (data) => {
          setGyroscope(data)
        })
        }>
        <Text>Start</Text>
        </TouchableOpacity>
        
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