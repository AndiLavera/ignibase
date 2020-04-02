import React, { useState, useEffect } from 'react'
import InboxIcon from '@material-ui/icons/MoveToInbox';
import getToken from '../../../Session/Session';

const AuthItems = () => {
  const [state, setState] = useState({ apps: [] });

  useEffect(() => {
    const res = fetch('http://localhost:9090/api/apps', {
      method: 'POST',
      headers: {
        'origin': 'localhost',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({token: getToken()})
    }).then(response => response.json())

    let apps = []

    res.then(data => {
      data.apps.map((app) => {
        apps.push({ name: app.name, label: app.name })
      })
    })

    setState({ apps: apps })
  }, []);

  return(
    [
      {
        name: 'home',
        label: 'Home',
        to: '/',
        Icon: InboxIcon
      },
      {
        name: 'dashboard',
        label: 'Dashboard',
        to: '/dashboard',
        Icon: InboxIcon
      },
      {
        name: 'apps',
        label: 'Apps',
        to: '/apps',
        Icon: InboxIcon
      },
      {
        name: 'signout',
        label: 'Sign Out',
        to: '/signout',
        Icon: InboxIcon
      },
      // This next object holds the drop down for user apps
      {
        name: 'projects',
        label: 'Projects',
        Icon: InboxIcon,
        to: '/apps',
        items: state.apps
      },
    ]
  )
}

export default AuthItems