import "./SideBarItems.css";
import React from 'react'
import { Link } from 'react-router-dom';

import List from '@material-ui/core/List';
import Divider from '@material-ui/core/Divider';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import InboxIcon from '@material-ui/icons/MoveToInbox';
import ExpandMoreIcon from "@material-ui/icons/ExpandMore";
import ExpandLessIcon from "@material-ui/icons/ExpandLess";
import Collapse from "@material-ui/core/Collapse";

import { currentUser } from '../../Session/CurrentUser'

const AuthLinks = ({ depthStep, depth, expanded }) => {
  const items = [
    { name: 'home', label: 'Home', to: '/', Icon: InboxIcon },
    { name: 'dashboard', label: 'Dashboard', to: '/dashboard', Icon: InboxIcon },
    { name: 'apps', label: 'Apps', to: '/apps', Icon: InboxIcon },
    { name: 'signout', label: 'Sign Out', to: '/signout', Icon: InboxIcon },
    {
      name: 'settings',
      label: 'Settings',
      Icon: InboxIcon,
      items: [
        { name: 'profile', label: 'Profile', Icon: InboxIcon },
        { name: 'insurance', label: 'Insurance', Icon: InboxIcon },
        {
          name: 'notifications',
          label: 'Notifications',
          items: [
            { name: 'email', label: 'Email' },
            {
              name: 'desktop',
              label: 'Desktop',
              items: [
                { name: 'schedule', label: 'Schedule' },
                { name: 'frequency', label: 'Frequency' },
              ],
            },
            { name: 'sms', label: 'SMS', Icon: InboxIcon },
          ],
        },
      ],
    }
  ]

  return(
    <div className="sidebar">
      <List>
        {items.map((sidebarItem, index) => (
          <React.Fragment key={`${sidebarItem.name}${index}`}>
            {sidebarItem === "divider" ? (
              <Divider style={{ margin: "6px 0" }} />
            ) : (
              <SidebarItem
                depthStep={depthStep}
                depth={depth}
                expanded={expanded}
                item={sidebarItem}
              />
            )}
          </React.Fragment>
        ))}
      </List>
    </div>
  )
}

const PublicLinks = ({ depthStep, depth, expanded }) => {
  const items = [
    { name: 'home', label: 'Home', to: '/', Icon: InboxIcon },
    { name: 'about', label: 'About', to: '/about', Icon: InboxIcon },
    { name: 'contact', label: 'Contact', to: '/contact', Icon: InboxIcon },
    "divider",
    { name: 'register', label: 'Register', to: '/signup', Icon: InboxIcon },
    { name: 'signin', label: 'Sign In', to: '/signin', Icon: InboxIcon },
  ]

  return(
    <div className="sidebar">
      <List>
        {items.map((sidebarItem, index) => (
          <React.Fragment key={`${sidebarItem.name}${index}`}>
            {sidebarItem === "divider" ? (
              <Divider style={{ margin: "6px 0" }} />
            ) : (
              <SidebarItem
                depthStep={depthStep}
                depth={depth}
                expanded={expanded}
                item={sidebarItem}
              />
            )}
          </React.Fragment>
        ))}
      </List>
    </div>
  )
}

function SidebarItem({ depthStep = 10, depth = 0, expanded, item, ...rest }) {
  const [collapsed, setCollapsed] = React.useState(true);
  const { label, items, Icon, onClick: onClickProp, to } = item;

  function toggleCollapse() {
    setCollapsed(prevValue => !prevValue);
  }

  function onClick(e) {
    if (Array.isArray(items)) {
      toggleCollapse();
    }
    if (onClickProp) {
      onClickProp(e, item);
    }
  }

  let expandIcon;

  if (Array.isArray(items) && items.length) {
    expandIcon = !collapsed ? (
      <ExpandLessIcon
        className={
          "sidebar-item-expand-arrow" + " sidebar-item-expand-arrow-expanded"
        }
      />
    ) : (
      <ExpandMoreIcon className="sidebar-item-expand-arrow" />
    );
  }

  return (
    <>
      <ListItem
        className="sidebar-item"
        component={Link}
        onClick={onClick}
        to={to}
        button
        dense
        {...rest}
      >
        <div
          style={{ paddingLeft: depth * depthStep }}
          className="sidebar-item-content"
        >
          {Icon && <Icon className="sidebar-item-icon" />}
          <div className="sidebar-item-text">{label}</div>
        </div>
        {expandIcon}
      </ListItem>
      <Collapse in={!collapsed} timeout="auto" unmountOnExit>
        {Array.isArray(items) ? (
          <List disablePadding dense>
            {items.map((subItem, index) => (
              <React.Fragment key={`${subItem.name}${index}`}>
                {subItem === "divider" ? (
                  <Divider style={{ margin: "6px 0" }} />
                ) : (
                  <SidebarItem
                    depth={depth + 1}
                    depthStep={depthStep}
                    item={subItem}
                  />
                )}
              </React.Fragment>
            ))}
          </List>
        ) : null}
      </Collapse>
    </>
  );
}

const SideBarLinks = () => {
  
  return(
    <>
      <Divider />
      {!currentUser() &&
        <PublicLinks />
      }
      {currentUser() &&
        <AuthLinks />
      }
    </>
  )
}

export default SideBarLinks