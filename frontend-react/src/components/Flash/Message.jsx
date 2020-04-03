import React from 'react'
import Cookies from 'universal-cookie'
import { Alert, AlertTitle } from '@material-ui/lab'

// ignibase.flash is stored as a json
// but looks like object literal with the severity
// being the key & message being the value
const FlashMessage = () => {
  const cookies = new Cookies()
  const messages = cookies.get('ignibase.flash')
  cookies.remove('ignibase.flash')

  return (
    <>
      {messages
        && Object.keys(messages).map((message) => (
          <Alert variant="filled" key={(!!message)} severity={message}>
            <AlertTitle>{message}</AlertTitle>
            {messages[message]}
          </Alert>
        ))}
    </>
  )
}

export default FlashMessage
