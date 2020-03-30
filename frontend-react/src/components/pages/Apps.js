import React, { useState } from 'react'
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import Button from '@material-ui/core/Button';

import AppsModal from '../Modals/AppsModal';
import getToken from '../Session/Session';

const useStyles = makeStyles({
  table: {
    minWidth: 650,
  },
});

function createData(name, calories, fat, carbs, protein) {
  return { name, calories, fat, carbs, protein };
}

const rows = () => {
  const res = fetch('http://localhost:9090/api/apps', {
    method: 'POST',
    headers: {
      'origin': 'localhost',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({token: getToken()})
  })
  return [
          createData('Frozen yoghurt', 159, 6.0, 24, 4.0),
          createData('Ice cream sandwich', 237, 9.0, 37, 4.3),
          createData('Eclair', 262, 16.0, 24, 6.0),
          createData('Cupcake', 305, 3.7, 67, 4.3),
          createData('Gingerbread', 356, 16.0, 49, 3.9),
  ]
}

const Apps = () => {
  const classes = useStyles();

  const [open, setOpen] = React.useState(false);

  const handleOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

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
              <TableCell align="right">Date Created</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {rows().map((row) => (
              <TableRow key={row.name}>
                <TableCell component="th" scope="row">
                  {row.name}
                </TableCell>
                <TableCell align="right">{row.calories}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
      <AppsModal open={open} setOpen={setOpen} handleClose={handleClose} />
    </>
  );
}

export default Apps