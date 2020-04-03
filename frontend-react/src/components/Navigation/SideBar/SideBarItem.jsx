import './SideBarItem.css'
import React from 'react'
import { Link } from 'react-router-dom'

import List from '@material-ui/core/List'
import Divider from '@material-ui/core/Divider'
import ListItem from '@material-ui/core/ListItem'
import ExpandMoreIcon from '@material-ui/icons/ExpandMore'
import ExpandLessIcon from '@material-ui/icons/ExpandLess'
import Collapse from '@material-ui/core/Collapse'

function SidebarItem({
  depthStep = 10, depth = 0, expanded, item, ...rest
}) {
  const [collapsed, setCollapsed] = React.useState(true)
  const {
    label, items, Icon, onClick: onClickProp, to,
  } = item

  function toggleCollapse() {
    setCollapsed((prevValue) => !prevValue)
  }

  function onClick(e) {
    if (Array.isArray(items)) {
      toggleCollapse()
    }
    if (onClickProp) {
      onClickProp(e, item)
    }
  }

  let expandIcon

  if (Array.isArray(items) && items.length) {
    expandIcon = !collapsed ? (
      <ExpandLessIcon
        className="sidebar-item-expand-arrow sidebar-item-expand-arrow-expanded"
      />
    ) : (
      <ExpandMoreIcon className="sidebar-item-expand-arrow" />
    )
  }

  return (
    <>
      <ListItem
        className="sidebar-item"
        component={to ? Link : undefined}
        onClick={onClick}
        to={to || undefined}
        button
        dense
        {...rest}
      >
        <div
          style={{ paddingLeft: depth * depthStep }}
          className="sidebar-item-content"
        >
          {Icon && <Icon className="sidebar-item-icon" />}
          <div className="sidebar-item-text">{label}</div>
        </div>
        {expandIcon}
      </ListItem>
      <Collapse in={!collapsed} timeout="auto" unmountOnExit>
        {Array.isArray(items) ? (
          <List disablePadding dense>
            {items.map((subItem, index) => (
              <React.Fragment key={`${subItem.name}${index}`}>
                {subItem === 'divider' ? (
                  <Divider style={{ margin: '6px 0' }} />
                ) : (
                  <SidebarItem
                    depth={depth + 1}
                    depthStep={depthStep}
                    item={subItem}
                  />
                )}
              </React.Fragment>
            ))}
          </List>
        ) : null}
      </Collapse>
    </>
  )
}

export default SidebarItem
