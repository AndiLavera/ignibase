import React from 'react'
import InboxIcon from '@material-ui/icons/MoveToInbox';

const PublicItems = () => {

  return(
    [
      { name: 'home', label: 'Home', to: '/', Icon: InboxIcon },
      { name: 'about', label: 'About', to: '/about', Icon: InboxIcon },
      { name: 'contact', label: 'Contact', to: '/contact', Icon: InboxIcon },
      "divider",
      { name: 'register', label: 'Register', to: '/signup', Icon: InboxIcon },
      { name: 'signin', label: 'Sign In', to: '/signin', Icon: InboxIcon },
    ]
  )
}

export default PublicItems