[![wercker status](https://app.wercker.com/status/8b20b8afc5a36ed37689fe7ada9b7d82/m "wercker status")](https://app.wercker.com/project/bykey/8b20b8afc5a36ed37689fe7ada9b7d82)

RG Portal
=====

## Development Environment Configuration

### Requirements

* Ruby 2.2.1
* Bundler
* Bower

### Recommends

* rbenv

### Slack OAuth configuration file

* Copy configuration sample from `config/oauth.yml.sample`

```
$ cp config/oauth.yml.sample config/oauth.yml
```
* Get the oauth information from [Slack RG AuthenticationのOAuth情報](http://portal.gw.sfc.wide.ad.jp/pages/service/portal/oauth) (require slack authentication)

* Do not create a new authentication yourself. The number of integrations has a limit.

### Gem installation

```
$ bundle install --path=vendor/bundle
```

If you have a error like `Failed to build gem native extension.` during installation of `libv8` or `therubyracer`, following configurations may help you.

```
$ bundle config build.libv8 --with-system-v8
$ bundle config build.therubyracer --with-v8-dir
```

### Copy emoji files to public directory

```
$ rake emoji
```

### JavaScript library installation

```
$ rake bower:install
```

### Database creation

```
$ bundle exec rake db:migrate RAILS_ENV=development
```

It will create database file like `db/development.sqlite3`
