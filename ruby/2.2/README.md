# ncareol/ruby:2.2

Adapted from [**Official Docker Ruby** images](https://hub.docker.com/_/ruby/), without the **Bundler** modifications that break local `vendor`'ing.

## Tags

- [`debian-for-rails-mariadb-2.2.6-2`](https://github.com/ncareol/docker-library/releases/tag/ncareol%2Fruby-debian-for-rails-mariadb-2.2.6-2)
  - add and set `ruby` USER
  - add `ruby-dev` and refrain from removing `buildDeps`, for building native gems

- [`debian-for-rails-mariadb-2.2.6-1`](https://github.com/ncareol/docker-library/releases/tag/ncareol%2Fruby-debian-for-rails-mariadb-2.2.6-1)
  - **Devise** usage by **MissionPlanner**: use `postfix` instead of `sendmail`

- [`debian-for-rails-mariadb-2.2.6-0`](https://github.com/ncareol/docker-library/releases/tag/ncareol%2Fdebian-for-rails-mariadb-2.2.6-0)
  - update **Ruby** to `2.2.6`
  - install `sendmail` for **Devise** usage by **MissionPlanner**

- [`debian-for-rails-mariadb-2.2.5-0`](https://github.com/ncareol/docker-library/releases/tag/ncareol%2Fruby-debian-for-rails-mariadb-2.2.5-0) switch from mysql to mariadb

- [`debian-for-rails-mysql-2.2.5`](https://github.com/ncareol/docker-library/releases/tag/ncareol%2Fruby-debian-for-rails-mysql-2.2.5) Debian-Jessie-based image w/ Ruby 2.2.5 and dependencies for mysql2 gem and other **CatalogMaps** gems

- [`alpine-for-rails-mariadb-2.2.5`](https://github.com/ncareol/docker-library/releases/tag/ncareol%2Fruby-alpine-for-rails-mariadb-2.2.5) Alpine-based image w/ Ruby 2.2.5 and dependencies for mysql2 gem and other **CatalogMaps** gems

  - based on <https://github.com/docker-library/ruby/blob/2d6449f03976ededa14be5cac1e9e070b74e4de4/2.2/alpine/Dockerfile>

- [`2.2.5-0`](https://github.com/ncareol/docker-library/releases/tag/ncareol%2Fruby-2.2.5-0)
