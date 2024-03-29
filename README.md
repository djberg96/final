[![Ruby](https://github.com/djberg96/final/actions/workflows/ruby.yml/badge.svg)](https://github.com/djberg96/final/actions/workflows/ruby.yml)

## Description
A Ruby module that can make your classes final. A final class cannot
be subclassed, and its instance methods cannot be redefined.

## Installation
`gem install final`

## Adding the trusted cert
`gem cert --add <(curl -Ls https://raw.githubusercontent.com/djberg96/final/main/certs/djberg96_pub.pem)`

## Synopsis
```ruby
require 'final'

class Alpha
  include Final

  def foo
    puts "Hello"
  end
end

# Error! You cannot subclass Alpha.
class Beta < Alpha; end

# Error! You cannot redefine an existing method.
class Alpha
  def foo
    puts "Hi"
  end
end

# Not an error. You can add new methods to an existing class.
class Alpha
  def bar
    puts "World"
  end
end
```

## Developer's Notes
This library is merely a proof of concept that was published as the result
of a tweet made by James Edward Gray II, where he commented that Ruby core
classes should never be subclassed. Knowing that static languages like Java
implement the "final" keyword as a way to prevent subclassing, I wanted to
see if something similar could be done for Ruby. Turns out it can.

I do not, however, necessarily advocate actually using this library in
production code. Freezing a class this way is contrary to the very nature
of Ruby and dynamic languages in general. If you're going to use it, you had
better have a very good reason for doing so!

## Caveats
Only instance methods are prevented from redefinition. Singleton methods are
not final. This change may happen in a future release.

## License
Apache-2.0

## Copyright
(C) 2003-2021 Daniel J. Berger
All Rights Reserved.

## Warranty
This package is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantability and fitness for a particular purpose.

## Author
Daniel J. Berger
