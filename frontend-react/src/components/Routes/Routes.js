import React, { Fragment } from 'react';
import { Route } from "react-router-dom";

import Home from "../pages/Home";
import Dashboard from "../pages/Dashboard";
import Documentation from "../pages/Docs";

const Routes = () => {

  return(
    <>
      <Route exact path="/" component={Home} />
      <Route exact path="/dashboard" component={Dashboard} />
      <Route exact path="/docs" component={Documentation} />
    </>
  )
}

export default Routes