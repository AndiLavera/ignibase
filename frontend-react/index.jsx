import React from 'react'
import ReactDOM from 'react-dom'
import './index.css'
import { BrowserRouter } from 'react-router-dom'
import App from './src/App'

if (module.hot) {
  module.hot.accept()
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <BrowserRouter>
      <App />
    </BrowserRouter>, document.getElementById('root'),
  )
})
