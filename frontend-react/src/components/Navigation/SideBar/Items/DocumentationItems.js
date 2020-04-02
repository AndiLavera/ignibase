import React from 'react'
import InboxIcon from '@material-ui/icons/MoveToInbox';

const DocumentationItems = () => {

  return(
    [
      {
        name: 'documentation',
        label: 'Documentation',
        Icon: InboxIcon,
        to: '/docs',
        items: [
          { name: 'profile', label: 'Profile', to: '/docs', Icon: InboxIcon },
          { name: 'insurance', label: 'Insurance', to: '/docs', Icon: InboxIcon },
          {
            name: 'notifications',
            label: 'Notifications',
            to: '/docs',
            items: [
              { name: 'email', label: 'Email', to: '/docs' },
              {
                name: 'desktop',
                label: 'Desktop',
                to: '/docs',
                items: [
                  { name: 'schedule', label: 'Schedule', to: '/docs' },
                  { name: 'frequency', label: 'Frequency', to: '/docs' },
                ],
              },
              { name: 'sms', label: 'SMS', to: '/docs', Icon: InboxIcon },
            ],
          },
        ],
      }
    ]
  )
}

export default DocumentationItems