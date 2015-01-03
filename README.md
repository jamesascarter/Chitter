### Twitter-Clone

Challenge set by Makers to create a Twitter clone that will allow users to post messages to a public stream.

Features:

I must be able to:

sign up to the service
be able to to login
log-out
post a message to Chitter
see all other peoples peeps in chronological order

Notes:

Sign up with email, password, name and a username
Username and email are unique
Peeps have name and username attached
Use Bcrypt to secure password
Use Datamapper and Postgres to save all the data
You don't have to be logged into see all the peeps
You can only peep if you are logged in

Deployment to Heroku:

This must be deployed with two seperate staging deployment targets: Staging and Production. This means having two Heroku apps that are being deployed to and three Github remotes(origin, staging and production).

Bonus:
Work on the CSS to make it look smart!!


### Tech

* Ruby-On-Rails
* Ruby
* Cucumber/Capybara (testing)
* Bcrypt
* Datamapper
* Postgres
* Sinatra
* Heroku
* Dillinger - Markdown Editor

### How to use


To run the tests:
```sh
$ rspec

```

Can access the site in your browser at:

https://chittabean.herokuapp.com/


### Improvements

* Allow users to start conversations based on tweets.
* Do some HTML/CSS to make it look better




