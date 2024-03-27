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

## Installation & Configuration
  ### Docker
  ```
  git clone <repo_url>
  cd <repo>

  # install and start
  docker compose up
  ```

  ### Without Docker
  ```
  git clone <repo_url>
  cd <repo>

  rake db:create
  rake db:migrate

  # start developer mode
  ./bin/dev
  ```