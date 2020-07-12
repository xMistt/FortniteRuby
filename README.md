<center><img src="https://i.imgur.com/q6gLoaU.png"></center>
<h2> Gem for interacting with Fortnite/Epic Games API.</h2><br>
<a href="https://rubygems.org/gems/fortniteruby><img src="https://img.shields.io/gem/dt/fortniteruby"></img></a>

[![Downloads](https://img.shields.io/gem/dt/fortniteruby)](https://rubygems.org/gems/fortniteruby)
[![Version](https://img.shields.io/gem/v/fortniteruby)](https://rubygems.org/gems/fortniteruby)
[![Last Commit](https://img.shields.io/github/last-commit/xmistt/fortniteruby)](https://github.com/xMistt/FortniteRuby)



## Installing:
```gem install fortniteruby```

After installing, you can check out the documentation for FortniteRuby [here](https://github.com/xMistt/FortniteRuby/wiki).
____
## Example:
```ruby
require 'fortniteruby'

# An exchange code is a one-time code that can be used to generate an access token.
# It is a much better solution than email & password due to captcha restricting automation.

# You can get one from: https://www.epicgames.com/id/logout?redirectUrl=https%3A//www.epicgames.com/id/login%3FredirectUrl%3Dhttps%253A%252F%252Fwww.epicgames.com%252Fid%252Fapi%252Fredirect%253FclientId%253D3446cd72694c4a4485d81b77adbb2141%2526responseType%253Dcode

client = FortniteClient.new(authorization_code="cade611bedc14c8dab0c68bcf4d5d692")
client.authenticate()

puts client.displayName
=> FortniteAccount123
```
____
