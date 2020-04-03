import Cookies from 'universal-cookie'

const currentUser = () => {
  const cookies = new Cookies()

  return !!(cookies.get('ignibase.session'))
}

export default currentUser
