import React, { useState } from 'react'
import { makeStyles } from '@material-ui/core/styles'
import Table from '@material-ui/core/Table'
import TableBody from '@material-ui/core/TableBody'
import TableCell from '@material-ui/core/TableCell'
import TableContainer from '@material-ui/core/TableContainer'
import TableHead from '@material-ui/core/TableHead'
import TableRow from '@material-ui/core/TableRow'
import Paper from '@material-ui/core/Paper'
import Button from '@material-ui/core/Button'

import AppsModal from '../Modals/AppsModal'
import getToken from '../Session/Session'

const useStyles = makeStyles({
  table: {
    minWidth: 650,
  },
})

const Apps = () => {
  const classes = useStyles()

  const [open, setOpen] = React.useState(false)

  const fetchData = async () => {
    const res = await fetch('http://localhost:9090/api/apps', {
      method: 'POST',
      headers: {
        origin: 'localhost',
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ token: getToken() }),
    })

    return await res.json()
  }

  const [state, setState] = useState({
    data: [],
    requested: false,
  })

  const rows = () => {
    if (state.requested === false) {
      fetchData().then((response) => setState({ data: response.apps, requested: true })).catch()
    }
    return state.data
  }

  const handleOpen = () => {
    setOpen(true)
  }

  const handleClose = () => {
    setState((prev) => ({ ...prev, requested: false }))
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
              // console.log(row)
              <TableRow key={row.id}>
                <TableCell component="th" scope="row">
                  {row.name}
                </TableCell>
                <TableCell align="right">{row.id}</TableCell>
                <TableCell align="right">{row.created_at}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
      <AppsModal open={open} setOpen={setOpen} handleClose={handleClose} />
    </>
  )
}

export default Apps
