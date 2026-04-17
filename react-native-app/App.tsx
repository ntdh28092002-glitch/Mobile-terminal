import React from 'react';
import {AppRegistry} from 'react-native';
import App from './App';

// Register the app
AppRegistry.registerComponent('MyApp', () => App);

// Ensure App is the main component to render
const index = () => <App />;
export default index;