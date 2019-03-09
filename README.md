# Api42

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'api42'  
```

```
$ bundle
```

Or install it yourself as:
```
$ gem install api42
```

## Debug
```
$ irb -Ilib -rapi42
```

## Usage
```ruby
client = Api42.new(client_id: 'xxx', client_secret: 'yyy')
users = client.users.get_all({sort: 'id', page: {number: 1}})
```

## Api documentation
https://api.intra.42.fr/apidoc/2.0.html
