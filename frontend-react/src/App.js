import React from 'react';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";

import amberLogo from './assets/amberLogo.png';
import reactLogo from './assets/reactLogo.png';
import './App.css';

import HelloAmber from './components/HelloAmber';
import HelloReact from './components/HelloReact';

import CssBaseline from '@material-ui/core/CssBaseline';
import Appbar from './components/AppBar/Frontend.js';

export default function App() {
  return (
    <React.Fragment>
      
      <CssBaseline />
      <Appbar />
      
    </React.Fragment>
    
  );
}