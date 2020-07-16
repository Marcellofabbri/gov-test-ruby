# gov-test-ruby

The API requires:
- ruby installed on the machine

Running tests:
- ```rspec``` from command line

The API can be used in a REPL like IRB or PRY, which operate from the command line.
Before it can work the class needs to be invoked. Therefore, from the command line in the root directory run:

```
irb
require './lib/finder'
finder = Finder.new
finder.filter_users_by_distance(50)
```

With the resulting array of hashes, depending on what further requirements are provided, these can be mapped into ruby objects or their names or details mapped into a list of strings etc.