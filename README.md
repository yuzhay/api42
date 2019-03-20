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
response = client.users.get_all({sort: 'id', page: {number: 1}})

# response.status
# response.data
# response.page_num
# response.total
# response.page_size
# response.request_id
# response.request_runtime
# response.application_id
# response.application_name
# response.application_roles
# response.rates_hourly_limit
# response.rates_hourly_remaining
# response.rates_secondly_limit
# response.rates_secondly_remaining

```

## Api documentation
https://api.intra.42.fr/apidoc/2.0.html
