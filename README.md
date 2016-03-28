# Crystal share price app

Simple crystal web server app to pull share prices from Yahoo finance

[See it live on heroku!](https://crystaltestapp.herokuapp.com/)

# Command for deploying to heroku

`heroku create crystaltestapp --buildpack https://github.com/zamith/heroku-buildpack-crystal.git`

Looks for `app.cr` file in main directory.