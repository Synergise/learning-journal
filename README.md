<a href="https://codeclimate.com/github/Synergise/learning-journal/maintainability"><img src="https://api.codeclimate.com/v1/badges/56dba4010aa27a6aa01f/maintainability" /></a>
[![Test Coverage](https://api.codeclimate.com/v1/badges/56dba4010aa27a6aa01f/test_coverage)](https://codeclimate.com/github/Synergise/learning-journal/test_coverage)
<img src="https://flat.badgen.net/dependabot/Synergise/learning-journal?icon=dependabot" alt="Dependabot Badge" />

# Learning journal

Contributors:

[Jason Wong](https://github.com/jasylwong/)
[Efstathios Stivaros](https://github.com/Stivaros)
[Maya Chukujama]()

[Objective](#Objective) | [Process](#process) | [Installation](#installation) | [Running the program](#running_the_program)

## Objective(s)

### Stath:
- Collate all learning resources into one app
- Practice system architecture and infrastructure engineering

### Jason:
- Learn how to link a Rails backend with a React frontend via an API
- Get experience working with an experienced dev and a UX specialist

### Maya:
- TBC

## Process

[Wireframes](https://jason842465.invisionapp.com/freehand/learning-journal-36SgV4eMJ?v=vjZVtVETrCEbCjPjKYYovg%3D%3D&linkshare=urlcopied)

[Brainstorming board](https://miro.com/app/board/o9J_ksZAM5U=/)

## Installation

### Dependencies & Requirements

* [Ruby 2.7.1](https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-7-1-released/) (we recommend [rbenv](https://github.com/rbenv/rbenv))
* [Ruby on Rails](https://rubyonrails.org/)
* [Node.js](https://nodejs.org/en/) (we recommend [nvm](https://github.com/nvm-sh/nvm))
* [npm](https://www.npmjs.com/get-npm)
* _Optional:_ [Docker](https://docs.docker.com/get-docker/)
* _Optional:_ [docker-compose](https://docs.docker.com/compose/install/)

## <a name="running_the_program">Running the program</a>

### Setup

* Clone the repo & `cd` into it
```
$ git clone https://github.com/Synergise/learning-journal.git
$ cd learning-journal
```
* Continue via [With Docker](#with-docker) or [Without Docker](#without-docker) below

#### With Docker
* Run `docker-compose up` to spin up docker containers for dev dependencies
* Run `bundle install` to install Ruby dependencies
* Run `yarn install` to install Node dependencies
* Run `rails db:create db:migrate` to create and prepare the database, by default the username is `postgres` and the password is `notinproduction`
* Run `rails s` to start the development server

#### Without Docker
* Ensure you have a local `postgres` up and running
* Run `bundle install` to install Ruby dependencies
* Run `yarn install` to install Node dependencies
* Run `rails db:create db:migrate` to create and prepare the database, by default the username is `postgres` and the password is `notinproduction`
* Run `rails s` to start the development server

### Testing, code coverage, and code style
```

```
