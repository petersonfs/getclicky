# Getclicky API Analytics Library

A swiss knife ruby wrapper for Getclicky API Analytics. For more information see: http://getclicky.com/help/api.

## Installation

``` ruby
## Gemfile for Rails 3, Sinatra, and Merb
gem 'getclicky', '~> 0.1'
```

## Usage

### Ruby wrapper

First, you'll need to set up your site_id and sitekey. You can discover this information by accessing settings in your account at http://getclicky.com.

``` ruby
Getclicky.configure do |config|
  config.site_id = "your site id here"
  config.sitekey = "your site key here"
end
```

Then you can simply instantiate a new Getclicky::Client object.

``` ruby
getclicky = Getclicky::Client.new
```
					
All types in API are methods here looks, you can find all types http://getclicky.com/help/api:

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
	
By default getclicky API returns an array of [Hashies](https://github.com/intridea/hashie) as data, but you can change by providing an :output parameter like:

##### JSON

``` ruby
getclicky.visitors(:output => :json, :date => "last-7-days", :daily => 1)
```
	
##### CSV

``` ruby
getclicky.visitors(:output => :csv, :date => "last-7-days", :daily => 1)
```
	
##### PHP

``` ruby
getclicky.visitors(:output => :php, :date => "last-7-days", :daily => 1)
```
	
Enjoy!

## Roadmap

* Multiple types for request
* Improve the tests
	
## Maintainer

* Peterson Ferreira (petersonferreiras@gmail.com)