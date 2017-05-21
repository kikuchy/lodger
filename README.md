# Lodger

Re-target your swift sourcefiles from Application target to Testtarget in your Xcode project.


Added testing source files to main application target wrongly?
Lodger removes source files for testing (ex. FooTests.swift, BarMock.swift, BazStub.swift, etc) from main application target and add that files to main application target.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lodger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lodger

## Usage

```console
$ lodger \
        <xcodeproj_path> \
        <production_target_name> \
        <test_target_name>
```

for example, 

```console
$ lodger path/to/MyProject/MyProject.xcodeproj MyProject MyProjectTests
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kikuchy/lodger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

