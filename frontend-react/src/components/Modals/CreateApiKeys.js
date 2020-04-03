import React, { useState, useEffect } from 'react';
import { Grid, FormControl, Modal, makeStyles, TextField, Button } from '@material-ui/core';

import getToken from '../Session/Session'

function rand() {
  return Math.round(Math.random() * 20) - 10;
}

function getModalStyle() {
  const top = 50 + rand();
  const left = 50 + rand();

  return {
    top: `${top}%`,
    left: `${left}%`,
    transform: `translate(-${top}%, -${left}%)`,
  };
}

const useStyles = makeStyles((theme) => ({
  paper: {
    position: 'absolute',
    width: 400,
    backgroundColor: theme.palette.background.paper,
    boxShadow: theme.shadows[5],
    padding: theme.spacing(2, 4, 3),
    borderRadius: '15px'
  },
}));

function CreateApiKeys({ open, handleClose, id, keys, axios }) {
  const classes = useStyles();
  // getModalStyle is not a pure function, we roll the style only on the first render
  const [modalStyle] = React.useState(getModalStyle);
  const [inputs, setInputs] = useState({
    app_id: '',
    environment: '',
    token: getToken()
  })
  const [status, setStatus] = useState({
    submitted: false,
    submitting: false,
    error: false,
    message: '',
  })

  const handleResponse = (status, msg) => {
    if (status === 201) {
      setStatus({
        submitted: true,
        submitting: false,
        error: false,
        message: msg,
      })
      setInputs({
        id: id,
        environment: '',
        token: getToken()
      })

      handleClose()
    } else {
      setStatus({
        submitted: false,
        submitting: false,
        error: true,
        message: msg,
      })
    }
  }

  const handleOnChange = e => {
    e.persist()
    setInputs(prev => ({
      ...prev,
      [e.target.id]: e.target.value
    }))

    setStatus({
      submitted: false,
      submitting: false,
      error: false,
      message: ''
    })
  }

  const handleOnSubmit = async e => {
    e.preventDefault()
    setStatus(prevStatus => ({ ...prevStatus, submitting: true }))
    axios.post('/api_key/create', {
      app_id: id,
      environment: inputs.environment,
      token: inputs.token
    })
    .then((res) => {
      console.log(res)
      keys.push({
        key: res.data.key,
        environment: res.data.environment,
        created_at: res.data.created_at
      })
      handleResponse(res.data.status, res.data)
    })
    .catch((error) => {
      // Logs errors for '/apps' request
      console.log(error);
    });
  }

  return (
    <>
      <Modal
        open={open}
        onClose={handleClose}
        aria-labelledby="simple-modal-title"
        aria-describedby="simple-modal-description"
      >
        <div style={modalStyle} className={classes.paper}>
          <h2 id="simple-modal-title">Create a new app</h2>
          <form className={classes.form} onSubmit={handleOnSubmit}>
            <Grid container spacing={2}>
              <Grid item xs={12} sm={6}></Grid>
              <FormControl>
                <TextField
                  autoComplete="fname"
                  name="environment"
                  variant="outlined"
                  onChange={handleOnChange}
                  required
                  value={inputs.environment}
                  fullWidth
                  id="environment"
                  label="Environment"
                  autoFocus
                />
              </FormControl>

              <Button
                type="submit"
                fullWidth
                variant="contained"
                color="primary"
                // className={classes.submit}
              >
                {!status.submitting
                  ? !status.submitted
                    ? 'Submit'
                    : 'Created'
                  : 'Submitting...'}
              </Button>
            </Grid>
          </form>
          {/* <AppModal /> */}
        </div>
      </Modal>
    </>
  );
}

export default CreateApiKeys