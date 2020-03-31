import Cookies from 'universal-cookie'

const getToken = () => {
  const cookies = new Cookies();
  const jwt = cookies.get('ignibase.session')
  return jwt.token
}

export default getToken