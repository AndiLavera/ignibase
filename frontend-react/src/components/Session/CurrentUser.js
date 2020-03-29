import Cookies from 'universal-cookie'

export const currentUser = () =>{
  const cookies = new Cookies();

  return !!(cookies.get('ignibase.session'))
}