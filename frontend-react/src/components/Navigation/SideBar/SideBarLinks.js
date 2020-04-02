import React from 'react'
import Divider from '@material-ui/core/Divider';

import { currentUser } from '../../Session/CurrentUser'
import SideBarItemGenerator from './ItemGenerator'
import AuthItems from './Items/AuthItems'
import PublicItems from './Items/PublicItems'
import DocumentationItems from './Items/DocumentationItems'

const SideBarLinks = () => {
  const authItems = AuthItems()
  const publicItems = PublicItems()

  const documentationItems = DocumentationItems()
  
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