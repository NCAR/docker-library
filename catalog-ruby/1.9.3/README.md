# ncareol/catalog-ruby-1.9.3-p545

**Ruby** `1.9.3-p545` image for **Field-Catalog** **Ruby** / **Rails** applications: built w/ **Bundler** and **MariaDB** (**MySQL**) dependencies installed.

Based on official [**CentOS**](https://hub.docker.com/_/centos/) **Docker** image.

<https://github.com/ncareol/docker-library/tree/master/catalog-ruby/1.9.3>

## Tags

- [`0.0.7`](https://github.com/ncareol/docker-library/releases/tag/ncareol/catalog-ruby-1.9.3-p545-0.0.7)
  - add and set to ruby `USER`
  -  trim down image size by removing `ruby-install` executable and `ri` documentation

- [`0.0.6`](https://github.com/ncareol/docker-library/releases/tag/ncareol/catalog-ruby-1.9.3-p545-0.0.6)
  - add `/root/.ssh` and install git for easier access of gems that are based on git repos

- `0.0.5`
  - initial, working functionality
  - minimized image size
  - based on [`catalog-ruby-1.9.3-p545-0.0.5`](https://github.com/ncareol/docker-library/releases/tag/catalog-ruby-1.9.3-p545-0.0.5)
