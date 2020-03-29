import Cookies from 'universal-cookie'

export const currentUser = () =>{
  const cookies = new Cookies();

  if (cookies.get('ignibase.session')) {
    return true
  }
  return false
}