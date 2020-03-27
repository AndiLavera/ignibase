import React, { useState } from 'react';
import Avatar from '@material-ui/core/Avatar';
import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import TextField from '@material-ui/core/TextField';
import Link from '@material-ui/core/Link';
import Grid from '@material-ui/core/Grid';
import Box from '@material-ui/core/Box';
import LockOutlinedIcon from '@material-ui/icons/LockOutlined';
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core/styles';
import Container from '@material-ui/core/Container';
import Cookies from 'universal-cookie'

const Copyright = () => {
  return (
    <Typography variant="body2" color="textSecondary" align="center">
      {'Copyright © '}
      <Link color="inherit" href="https://material-ui.com/">
        Your Website
      </Link>{' '}
      {new Date().getFullYear()}
      {'.'}
    </Typography>
  );
}

const useStyles = makeStyles((theme) => ({
  paper: {
    marginTop: theme.spacing(8),
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
  },
  avatar: {
    margin: theme.spacing(1),
    backgroundColor: theme.palette.secondary.main,
  },
  form: {
    width: '100%', // Fix IE 11 issue.
    marginTop: theme.spacing(3),
  },
  submit: {
    margin: theme.spacing(3, 0, 2),
  },
}));

const SignIn = () => {
  const classes = useStyles();

  const [status, setStatus] = useState({
    submitted: false,
    submitting: false,
    error: false,
    message: ''
  })

  const [inputs, setInputs] = useState({
    email: '',
    password: ''
  })

  const handleResponse = (status, msg) => {
    if (status === 201) {
      setStatus({
        submitted: true,
        submitting: false,
        error: false,
        message: JSON.stringify(msg)
      })
      setInputs({
        email: '',
        firstName: '',
        lastName: '',
        password: '',
        termsOfService: false
      })

      const cookies = new Cookies();
      cookies.set(
        'session',
        { 
          token: msg["user"]["token"],
          id: msg["user"]["id"]
        },
        { path: '/' }
      )
    } else {
      setStatus({
        submitted: false,
        submitting: false,
        error: true,
        message: JSON.stringify(msg)
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
    const res = await fetch('http://localhost:9090/api/v1/session', {
      method: 'POST',
      headers: {
        'origin': 'localhost',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(inputs)
    })
    const text = await res.text()
    const response = JSON.parse(text)
    handleResponse(response["status"], response)
  }

  return (
    <Container component="main" maxWidth="xs">
      <CssBaseline />
      <div className={classes.paper}>
        <Avatar className={classes.avatar}>
          <LockOutlinedIcon />
        </Avatar>
        <Typography component="h1" variant="h5">
          Sign up
        </Typography>
        <form className={classes.form} onSubmit={handleOnSubmit}>
          <Grid container spacing={2}>
            <Grid item xs={12}>
              <TextField
                variant="outlined"
                onChange={handleOnChange}
                required
                value={inputs.email}
                fullWidth
                id="email"
                label="Email Address"
                name="email"
                autoComplete="email"
              />
            </Grid>
            <Grid item xs={12}>
              <TextField
                variant="outlined"
                onChange={handleOnChange}
                required
                value={inputs.password}
                fullWidth
                name="password"
                label="Password"
                type="password"
                id="password"
                autoComplete="current-password"
              />
            </Grid>
          </Grid>
          <Button
            type="submit"
            fullWidth
            variant="contained"
            color="primary"
            className={classes.submit}
          >
            {!status.submitting
              ? !status.submitted
                ? 'Sign In'
                : 'Success'
              : 'Submitting...'}
          </Button>

          {status.error && (
            <div className="error">Error: {status.message}</div>
          )}
          {!status.error && status.message && (
            <div className="success">{status.message}</div>
          )}

          <Grid container justify="flex-end">
            <Grid item>
              <Link href="#" variant="body2">
                Already have an account? Sign in
              </Link>
            </Grid>
          </Grid>
        </form>
      </div>
      <Box mt={5}>
        <Copyright />
      </Box>
    </Container>
  );
}

export default SignIn