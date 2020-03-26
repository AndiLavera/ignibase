import React from 'react';
import { Link } from "react-router-dom";
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';

const HomeLinks = ({ onItemClick }) => {
  return(
    <List>
      <ListItem button component={Link} to="/" onClick={onItemClick('Home')}>
        <ListItemText>Home</ListItemText>
      </ListItem>
      <ListItem button component={Link} to="/dashboard" onClick={onItemClick('Dashboard')}>
        <ListItemText>Dashboard</ListItemText>
      </ListItem>
      <ListItem button to="/docs" onClick={onItemClick('Documentation')}>
        <ListItemText>Documentation</ListItemText>
      </ListItem>
    </List>
  )
}

export default HomeLinks