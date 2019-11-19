<center><img src="https://i.imgur.com/q6gLoaU.png"></center>
<h2> Gem for interacting with Fortnite/Epic Games API.</h2><br>
<a href="https://rubygems.org/gems/fortniteruby><img src="https://img.shields.io/gem/dt/fortniteruby"></img></a>

Installing:<br>
```gem install fortniteruby```

Example:
```ruby
require 'fortniteruby'

client FortniteClient.new('email@email.com', 'password')

puts client.displayName
=> FortniteAccount123
```
