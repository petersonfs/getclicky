# Clicky Analytics API Library

[![Build Status](https://travis-ci.org/petersonfs/getclicky.svg?branch=master)](https://travis-ci.org/petersonfs/getclicky)

A swiss knife ruby wrapper for Clicky Analytics API. For more information see: http://clicky.com/help/api.

## Installation

``` ruby
## Gemfile for Rails, Sinatra
gem 'getclicky', '~> 0.1.4'
```

## Usage

### Ruby wrapper

First, you'll need to set up your site_id and sitekey. You can discover this information by accessing settings in your account at http://clicky.com.

``` ruby
Getclicky.configure do |config|
  config.site_id = "your site id here"
  config.sitekey = "your site key here"
  config.admin_sitekey = "your admin site key, if applicable"
end
```

Then you can simply instantiate a new Getclicky::Client object.

``` ruby
getclicky = Getclicky::Client.new
```

All types in API are methods here looks, you can find all types http://clicky.com/help/api:

``` ruby
getclicky.pages()
getclicky.tweets()
getclicky.visitors()
```

In each method you can pass optional parameters as a hash looks:

``` ruby
getclicky.visitors(:date => "last-7-days", :daily => 1)
getclicky.item(:date => "last-7-days", :item => "google.com")
getclicky.visitors_list(:domain => "google.com")
```

You can also request more than one data type in a single request:

``` ruby
getclicky.multiple([:pages, :downloads], {:date => "last-7-days"})
```

By default clicky API returns an array of [Hashies](https://github.com/intridea/hashie) as data, but you can change by providing an :output parameter like:

##### JSON

``` ruby
getclicky.visitors(:output => :json, :date => "last-7-days", :daily => 1)
```

##### XML

``` ruby
getclicky.visitors(:output => :xml, :date => "last-7-days", :daily => 1)
```

Enjoy!

## Roadmap

* Improve the tests

## Author
* Peterson Ferreira ([petersonfs.me](petersonfs.me))

## Collaborators
* Bobby Uhlenbrock ([github.com/uhlenbrock](github.com/uhlenbrock))
