import React from 'react'
import { Link } from 'react-router-dom';

import List from '@material-ui/core/List';
import Divider from '@material-ui/core/Divider';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import InboxIcon from '@material-ui/icons/MoveToInbox';
import MailIcon from '@material-ui/icons/Mail';

import { currentUser } from '../../Session/CurrentUser'

const Frontend = () => {
  return(
    <>
      <Divider />
        <List>
          {['/', '/about', '/contact'].map((text, index) => (
            <ListItem component={Link} to={text} button key={text}>
              <ListItemIcon>{index % 2 === 0 ? <InboxIcon /> : <MailIcon />}</ListItemIcon>
              <ListItemText primary={text} />
            </ListItem>
          ))}
        </List>
      <Divider />
      <List>
        {!currentUser() &&
          ['Signin', 'Signup'].map((text, index) => (
            <ListItem component={Link} to={`/${text.toLowerCase()}`} button key={text}>
              <ListItemIcon>{index % 2 === 0 ? <InboxIcon /> : <MailIcon />}</ListItemIcon>
              <ListItemText primary={text} />
            </ListItem>
          ))
        }
        {currentUser() &&
          <>
            <ListItem button component={Link} to={'/dashboard'} key={"Dashboard"}>
              <ListItemIcon><InboxIcon /></ListItemIcon>
              <ListItemText primary={"Dashboard"} />
            </ListItem>

            <ListItem button component={Link} to={'/apps'} key={"Apps"}>
              <ListItemIcon><InboxIcon /></ListItemIcon>
              <ListItemText primary={"Apps"} />
            </ListItem>

            <ListItem button component={Link} to={'/signout'} key={"Sign Out"}>
              <ListItemIcon><InboxIcon /></ListItemIcon>
              <ListItemText primary={"Sign Out"} />
            </ListItem>
          </>
        }
      </List>
    </>
  )
}

export default Frontend