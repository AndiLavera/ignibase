import React from 'react'

import { useTheme } from '@material-ui/core/styles';

import MainSideBar from './MainSideBar'
import MainAppBar from './MainAppBar'

const Navigation = (props) => {
  const { classes, open, handleDrawerClose, handleDrawerOpen} = props
  const theme = useTheme();

  return(
    <>
      <MainAppBar
        classes={classes}
        handleDrawerOpen={handleDrawerOpen}
        open={open}
      />
      
      <MainSideBar
        classes={classes}
        theme={theme}
        handleDrawerClose={handleDrawerClose}
        open={open}
      />
    </>
  )
}

export default Navigation