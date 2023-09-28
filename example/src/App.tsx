import React, { useEffect ,useState } from 'react';
import { View, Text,  } from 'react-native';
import {
  start,
  stop,
  isSensorAvailable,
  onSensorChanged,
  removeSensorListener,
} from 'react-native-all-sensors';

export default function App() {
  const [proximity, setProximity] = useState(0);
  useEffect(() => {
    // Check if a sensor is available
    isSensorAvailable('proximity')
      .then((available) => {
        if (available) {
          console.log('Proximity sensor is available.');
          // Start listening to sensor changes
          start('proximity').then((started) => {
            if (started) {
              console.log('Sensor started successfully');
            }
          })
          .catch((error) => {
            console.error('Failed to start sensor', error);
          });

          // Add a listener for sensor data
          onSensorChanged('ProximityData', (data) => {
            setProximity(data);
          });
        } else {
          console.log('Proximity sensor is not available.');
        }
      })
    // Stop listening when the component unmounts
    return () => {
      stop('proximity')
        .then(() => {
          console.log('Proximity sensor stopped.');
        })
        .catch((error) => {
          console.error('Error stopping proximity sensor:', error);
        });

      // Remove the sensor listener
      removeSensorListener('proximity', (data) => {
        console.log('Removed proximity sensor listener.');
      });
    };
  }, []);

  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text>React Native Sensors Example</Text>
      <Text>Proximity sensor: {proximity}</Text>
      {/* Add UI components here */}
    </View>
  );
}
