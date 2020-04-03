import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { makeStyles } from '@material-ui/core/styles'
import Table from '@material-ui/core/Table'
import TableBody from '@material-ui/core/TableBody'
import TableCell from '@material-ui/core/TableCell'
import TableContainer from '@material-ui/core/TableContainer'
import TableHead from '@material-ui/core/TableHead'
import TableRow from '@material-ui/core/TableRow'
import Paper from '@material-ui/core/Paper'
import Button from '@material-ui/core/Button'

import CreateApiKeys from '../../Modals/CreateApiKeys'
import getToken from '../../Session/Session'

const axios = require('axios').default.create({
  baseURL: 'http://localhost:9090/api/',
  timeout: 1000,
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
  },
})

const useStyles = makeStyles({
  table: {
    minWidth: 650,
  },
})

const ApiKeys = () => {
  const params = useParams()
  const classes = useStyles()
  const token = getToken()
  const [state, setState] = useState({
    keys: [],
    id: '',
  })
  const [open, setOpen] = React.useState(false)

  useEffect(() => {
    // Fetch apps on `componentDidMount`
    axios.post('/apps', {
      token,
    })
      .then((res) => {
      // Then we iterate through the apps
        res.data.apps.filter(((app) => {
        // Check if this iterations app name equals the param name
          if (params.name === app.name) {
          // With the correct id, we can now properly access this projects api keys
            axios.post('/api_key', {
              token,
              app_id: app.id,
            })
              .then((response) => {
              // Set the keys in state for iterating
              // Set the id in state for the creation modal
                setState({ keys: response.data.keys, id: app.id })
              })
              .catch((error) => {
              // Logs errors for '/api_key' request
                console.log(error)
              })
          }
        }))
      }).catch((error) => {
      // Logs errors for '/apps' request
        console.log(error)
      })
  }, [])

  const rows = () => state.keys || []

  const handleOpen = () => {
    setOpen(true)
  }

  const handleClose = () => {
    setState((prev) => ({
      ...prev,
    }))
    setOpen(false)
  }

  return (
    <>
      <Button variant="contained" color="primary" onClick={handleOpen}>
        Primary
      </Button>
      <TableContainer component={Paper}>
        <Table className={classes.table} aria-label="simple table">
          <TableHead>
            <TableRow>
              <TableCell>App Name</TableCell>
              <TableCell align="right">ID</TableCell>
              <TableCell align="right">Date Created</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {rows().map((row) => (
              <TableRow key={row.key}>
                <TableCell component="th" scope="row">
                  {row.key}
                </TableCell>
                <TableCell align="right">{row.environment}</TableCell>
                <TableCell align="right">{row.created_at}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
      <CreateApiKeys
        open={open}
        handleClose={handleClose}
        id={state.id}
        keys={state.keys}
        axios={axios}
      />
    </>
  )
}

export default ApiKeys
