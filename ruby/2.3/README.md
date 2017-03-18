# ncareol/ruby:2.3

Adapted from [**Official Docker Ruby** images](https://hub.docker.com/_/ruby/), without the **Bundler** modifications that break local `vendor`'ing.

## Tags


- [`debian-for-rails-mariadb-2.3.3-3`](https://github.com/ncareol/docker-library/releases/tag/ncareol%2Fruby-debian-for-rails-mariadb-2.3.3-3)
  - add and set `ruby` USER
  - remove `buildDeps` and `/usr/share/{doc,man}` to reduce image size

- [`debian-for-rails-mariadb-pg-2.3.3-0`](https://github.com/ncareol/docker-library/releases/tag/ncareol%2Fruby-debian-for-rails-mariadb-pg-2.3.3-0)
  - install `libpq-dev` for usage of `PostgresAdapter` in `catalogdatebrowse`

- [`debian-for-rails-mariadb-2.3.3-2`](https://github.com/ncareol/docker-library/releases/tag/ncareol%2Fruby-debian-for-rails-mariadb-2.3.3-2)
  - install `openssh-client` for easier access of gems that are based on git repos

- [`debian-for-rails-mariadb-2.3.3-1`](https://github.com/ncareol/docker-library/releases/tag/ncareol%2Fruby-debian-for-rails-mariadb-2.3.3-1)
  - install git for easier access of gems that are based on git repos

- [`debian-for-rails-mariadb-2.3.3-0`](https://github.com/ncareol/docker-library/releases/tag/ncareol%2Fruby-debian-for-rails-mariadb-2.3.3-0)
