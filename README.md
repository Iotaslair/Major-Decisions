# README

Ruby version: `2.6.3`

Rails version: `5.2.4.1`

## Story behind Major Decisions
This is website my team created in my Software Engineering class. It's supposed to a website that students use to track their progress through college. Faculty members can create Areas of Concentrations (AOC, aka Major) add courses to their AOCs and allows students to take courses. This project was completed in 4 weeks with a team of 4 people. I made a duplicate of the repo because the original repo is private. 

## Link to live site
https://majordecisions.herokuapp.com/
It's possible that the website will go down eventually since it's running on Heroku's free plan but as of right now it works. Also, it will very likely take 30-ish seconds to connect at first, Heroku's servers are starting up and once the first page loads it should work well. We cannot remove this loading time without upgrading the plan the website is running on.
If you'd like to take a look around there is a few test accounts, one of a faculty member and a student

Username: faculty@ncf.edu
Password: password

Username: student@ncf.edu
Password: password


## Developing locally
`bundle install` in order to install necessary gems.
`rails db:migrate` to create the data base
`rails db:reset` will setup the tables and seed them with some default values (`rails db:seed`)
You'll also need to install postgres locally, but I can't exactly remember how to do that.
