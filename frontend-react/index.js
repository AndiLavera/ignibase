import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './src/App';
import { BrowserRouter } from 'react-router-dom';

if(module.hot){
  module.hot.accept()
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
  <BrowserRouter>
    <App />
  </BrowserRouter>, document.getElementById('root'));
})
