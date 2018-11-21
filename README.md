# SearchTweetsApp
**SearchTweetsApp** is an app that displays tweets based on search term 

## Installation
Create gemset:

```
rvm ruby-2.5.1 do rvm gemset create search_tweets_app
```

install gems:

```
bundle install
```


and add credentials:

```
EDITOR=vim bundle exec rails credentials:edit
```

There is an example of credentials in directory `config/credentials.yml.example`.
## How to run tests?
```
bundle exec rspec
```

## How to run app?
```
rails s
```
