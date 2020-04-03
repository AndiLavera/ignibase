import React from 'react'
import { Redirect } from "react-router-dom"
import Cookies from 'universal-cookie'

const SignOut = () => {
  const cookies = new Cookies()
  cookies.remove('ignibase.session')
  cookies.set('ignibase.flash', {success: 'Successfully signed out'})

  return(
    <>
      <Redirect to='/' />
    </>
  )
}

export default SignOut