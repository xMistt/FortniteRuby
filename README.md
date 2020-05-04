<center><img src="https://i.imgur.com/q6gLoaU.png"></center>
<h2> Gem for interacting with Fortnite/Epic Games API.</h2><br>
<a href="https://rubygems.org/gems/fortniteruby><img src="https://img.shields.io/gem/dt/fortniteruby"></img></a>

Installing:<br>
```gem install fortniteruby```

Example:
```ruby
require 'fortniteruby'

# An exchange code is a one-time code that can be used to generate an access token.
# It is a much better solution than email & password due to captcha blocks.

# You can get one from: https://www.epicgames.com/id/logout?lang=en-US&redirectUrl=https%3A//www.epicgames.com/id/login%3FredirectUrl%3Dhttps%253A%252F%252Fwww.epicgames.com%252Fid%252Fapi%252Fexchange&lang=en-US

client = FortniteClient.new(exchange_code="cade611bedc14c8dab0c68bcf4d5d692")
client.authenticate()

puts client.displayName
=> FortniteAccount123
```
