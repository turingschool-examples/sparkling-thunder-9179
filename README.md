
[DB Diagram Table](https://dbdiagram.io/d/645986badca9fb07c4b9e033)
# Movie Tracker

This repository requires and has been tested on Ruby v3.1.1 and is based on Rails 7.0.4.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <repo_name>`
4. `cd <repo_name>`
5. `bundle install`
6. `rails db:{drop,create,migrate,seed}`

When you run `bundle exec rspec` you should have 2 passing tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* When you are finished, push your code to your fork. 

## Submission

**Once the time for the assessment is up**, create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through.

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## Overview

We are creating an application to track movies.

* Studios have a name and location
  * ex: name: 'Universal Studios', location: 'Hollywood'
* Movies have a title, creation year, and genre
  * ex: title: 'Toy Story', creation_year: '1995', genre: 'animation'
* Actors have a name and age
  * ex: name: 'Meryl Streep', age: 73
* Studios have many movies
* Movies belong to a studio
* Movies have many actors
* Actors can be in many movies

You will need to create any new migrations.

## User Stories

```
Story 1 - Studio Index

As a user,
When I visit the studio index page,
Then I see all of the studios including name and location,
And under each studio I see all of the studio's movies
including the movie's title, creation year, and genre
```

```
Story 2 - Movie Show

As a user,
When I visit a movie's show page.
I see the movie's title, creation year, and genre,
and a list of all its actors from youngest to oldest.
And I see the average age of all of the movie's actors
```

```
Story 3
Add an Actor to a Movie

As a user,
When I visit a movie show page,
I do not see any actors listed that are not part of the movie
And I see a form to add an actor to this movie
When I fill in the form with the ID of an actor that exists in the database
And I click submit
Then I am redirected back to that movie's show page
And I see the actor's name is now listed
(You do not have to test for a sad path, for example if the id submitted is not an existing actor)
```

## Extension

```
Extension
Studio's Actors

As a user,
When I visit a studio's show page
I see the studio's name and location
And I see a unique list of all of the actors that have worked on any of this studio's movies.
```
