doctype html
html
  head
    title {{ display_name }} using Amber with Vue
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1"
    link rel="icon" href="/favicon.png"
    link rel="icon" type="image/x-icon" href="/favicon.ico"
    link rel="stylesheet" href="/dist/main.bundle.css"
    script src="/dist/main.bundle.js"
    link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"
    meta name="viewport" content="minimum-scale=1, initial-scale=1, width=device-width"

  body
    noscript
      strong
        | We're sorry but Vue doesn't work properly without JavaScript enabled. Please enable it to continue.
    == content