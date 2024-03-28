# README
## Introduce:
  This is a project that uses Ruby on Rails 7. It includes functionalities for user registration, login, and authentication.
  Users can share their favorite videos on YouTube. And it will notify other users when you share a new video.


## Prerequisites:
  - Docker
  - Docker compose
  - Ruby
  - Database Postgre
  - Redis
  - Node version > 18

## Installation & Configuration
  ### Docker
  ```
  git clone  https://github.com/tnbach1712/my_remitano
  cd my_remitano

  # install and start
  docker compose up
  ```

  ### Without Docker
  ```
  git clone https://github.com/tnbach1712/my_remitano
  cd my_remitano

  # create database
  rake db:create

  # Create table
  rake db:migrate

  # start developer mode
  ./bin/dev

  # command above will start  process:
  # web: env RUBY_DEBUG_OPEN=true bin/rails server -b 0.0.0.0
  # worker: bundle exec sidekiq -c 1

  # To compile js and css

  # js: yarn build --watch
  # css: yarn build:css --watch

  ```

## Run test
  ```
  rspec
  ```