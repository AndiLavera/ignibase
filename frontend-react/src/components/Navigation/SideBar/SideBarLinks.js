import React from 'react'

import { currentUser } from '../../Session/CurrentUser'
import SideBarItemGenerator from './ItemGenerator'
import InboxIcon from '@material-ui/icons/MoveToInbox';
import Divider from '@material-ui/core/Divider';

const SideBarLinks = () => {
  const authItems = [
    { name: 'home', label: 'Home', to: '/', Icon: InboxIcon },
    { name: 'dashboard', label: 'Dashboard', to: '/dashboard', Icon: InboxIcon },
    { name: 'apps', label: 'Apps', to: '/apps', Icon: InboxIcon },
    { name: 'signout', label: 'Sign Out', to: '/signout', Icon: InboxIcon },
  ]

  const publicItems = [
    { name: 'home', label: 'Home', to: '/', Icon: InboxIcon },
    { name: 'about', label: 'About', to: '/about', Icon: InboxIcon },
    { name: 'contact', label: 'Contact', to: '/contact', Icon: InboxIcon },
    "divider",
    { name: 'register', label: 'Register', to: '/signup', Icon: InboxIcon },
    { name: 'signin', label: 'Sign In', to: '/signin', Icon: InboxIcon },
  ]

  const documentationItems = [
    {
      name: 'documentation',
      label: 'Documentation',
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
    <>
      <Divider />
      {!currentUser() &&
        <SideBarItemGenerator items={publicItems} />
      }
      {currentUser() &&
        <SideBarItemGenerator items={authItems} />
      }
      
      <SideBarItemGenerator items={documentationItems} />
    </>
  )
}

export default SideBarLinks