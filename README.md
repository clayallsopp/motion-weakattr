# motion-weakattr

A zeroing `attr_accessor` replacement using `WeakRef`:

```ruby
class MyClass
  weak_attr :delegate
end

@obj = MyClass.new
autorelease_pool {
  @obj.delegate = MyDelegate.new # wraps `delegate` in a WeakRef
  @obj.delegate
# => #<MyDelegate:0x123123>
}
@obj.delegate # after deallocation
# => nil
```


## Installation

Add this line to your application's Gemfile:

    gem 'motion-weakattr'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-weakattr


## Contact

[Clay Allsopp](http://twitter.com/clayallsopp)
[clay@usepropeller.com](mailto:clay@usepropeller.com)
