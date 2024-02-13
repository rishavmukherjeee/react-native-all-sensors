import {
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
  ScrollView,
} from 'react-native';
import React, { useState } from 'react';
import { startNow, stopNow } from 'react-native-all-sensors';
const App = () => {
  const [accelerometer, setAccelerometer] = useState({ x: 0, y: 0, z: 0 });
  const [gyroscope, setGyroscope] = useState({ x: 0, y: 0, z: 0 });
  return (
    <ScrollView contentContainerStyle={{ flexGrow: 1 }}>
      <Text style={styles.text}>
        Accelerometer: {accelerometer.x} {accelerometer.y} {accelerometer.z}
      </Text>

      <View style={styles.row}>
        <TouchableOpacity
          style={styles.stop}
          onPress={() => stopNow('accelerometer')}
        >
          <Text>STOP</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={styles.start}
          onPress={() =>
            startNow('accelerometer', (data) => {
              setAccelerometer(data);
            })
          }
        >
          <Text>Start</Text>
        </TouchableOpacity>
      </View>

      <Text style={styles.text}>
        Gyroscope: {gyroscope.x} {gyroscope.y} {gyroscope.z}
      </Text>
      <View style={styles.row}>
        <TouchableOpacity
          style={styles.stop}
          onPress={() => stopNow('gyroscope')}
        >
          <Text>STOP</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={styles.start}
          onPress={() =>
            startNow('gyroscope', (data) => {
              setGyroscope(data);
            })
          }
        >
          <Text>Start</Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  );
};

export default App;

const styles = StyleSheet.create({
  text: {
    marginTop: 20,
    fontSize: 20,
    textAlign: 'center',
  },
  row: {
    flexDirection: 'row',
  },
  start: {
    flex: 1,
    alignItems: 'center',
    backgroundColor: 'green',
    height: 50,
    justifyContent: 'center',
  },
  stop: {
    flex: 1,
    alignItems: 'center',
    backgroundColor: 'red',
    height: 50,
    justifyContent: 'center',
  },
});
