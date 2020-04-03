import React from 'react'

import Drawer from '@material-ui/core/Drawer';
import ChevronLeftIcon from '@material-ui/icons/ChevronLeft';
import ChevronRightIcon from '@material-ui/icons/ChevronRight';
import IconButton from '@material-ui/core/IconButton';
import Divider from '@material-ui/core/Divider';

import { currentUser } from '../../Session/CurrentUser'
import ItemGenerator from './ItemGenerator'
import AuthItems from './Items/AuthItems'
import PublicItems from './Items/PublicItems'
import DocumentationItems from './Items/DocumentationItems'

const SideBar = ({ classes, theme, handleDrawerClose, open }) => {
  const authItems = AuthItems()
  const publicItems = PublicItems()
  const documentationItems = DocumentationItems()

  return(
    <Drawer
      className={classes.drawer}
      variant="persistent"
      anchor="left"
      open={open}
      classes={{
        paper: classes.drawerPaper,
      }}
    >
      <div className={classes.drawerHeader}>
        <IconButton onClick={handleDrawerClose}>
          {theme.direction === 'ltr' ? <ChevronLeftIcon /> : <ChevronRightIcon />}
        </IconButton>
      </div>
      
      <Divider />

      {!currentUser() &&
        <ItemGenerator items={publicItems} />
      }

      {currentUser() &&
        <ItemGenerator items={authItems} />
      }
      
      <ItemGenerator items={documentationItems} />
    </Drawer>
  )
}

export default SideBar