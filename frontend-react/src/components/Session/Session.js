import Cookies from 'universal-cookie'

const getToken = () => {
  const cookies = new Cookies()
  const jwt = cookies.get('ignibase.session')
  if (jwt) {
    return jwt.token
  }
}

export default getToken
