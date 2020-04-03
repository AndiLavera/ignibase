import React from 'react'
import { Switch, Route } from 'react-router-dom';

import Home from '../pages/Home';
import About from '../pages/About';
import Contact from '../pages/Contact';
import SignUp from '../pages/SignUp';
import SignIn from '../pages/SignIn';
import SignOut from '../pages/SignOut'
import Dashboard from '../pages/Dashboard'
import Apps from '../pages/Apps'
import ApiKeys from '../pages/projects/ApiKeys'

const Routes = (props) => {
  const { classes } = props

  return(
    <Switch>
      <Route
        exact path='/'
        render={(props) => <Home {...props} classes={classes} />}
      />
      <Route
        exact path='/contact'
        render={(props) => <Contact {...props} classes={classes} />}
      />
      <Route
        exact path='/about'
        render={(props) => <About {...props} classes={classes} />}
      />
      <Route
        exact path='/signup'
        render={(props) => <SignUp {...props} />}
      />

      <Route
        exact path='/signin'
        render={(props) => <SignIn {...props} />}
      />


      {/* Requires auth */}
      <Route
        exact path='/signout'
        render={(props) => <SignOut {...props} />}
      />

      <Route
        exact path='/dashboard'
        render={(props) => <Dashboard {...props} />}
      />

      <Route
        exact path='/apps'
        render={(props) => <Apps {...props} />}
      />

      <Route
        path='/projects/:name/api_keys'
        render={(props) => <ApiKeys {...props} />}
      />
    </Switch>
  )
}

export default Routes