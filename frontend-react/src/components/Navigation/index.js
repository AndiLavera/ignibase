import React from 'react'

import { useTheme } from '@material-ui/core/styles';

import SideBar from './SideBar'
import AppBar from './AppBar'

const Navigation = ({ classes, open, handleDrawerClose, handleDrawerOpen}) => {
  const theme = useTheme();

  return(
    <>
      <AppBar
        classes={classes}
        handleDrawerOpen={handleDrawerOpen}
        open={open}
      />
      
      <SideBar
        classes={classes}
        theme={theme}
        handleDrawerClose={handleDrawerClose}
        open={open}
      />
    </>
  )
}

export default Navigation