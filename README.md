# Getclicky API Analytics Library

A swiss knife ruby wrapper for Getclicky API Analytics. For more information see: http://getclicky.com/help/api.

## Installation

``` ruby
## Gemfile for Rails 3, Sinatra, and Merb
gem 'will_paginate', '~> 3.0'
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

### Usage
					
All types in API are methods here looks, you can find all types http://getclicky.com/help/api:

``` ruby
getClicky.pages()
getClicky.tweets()
getClicky.visitors()
```
	
In each method you can pass optional parameters as a hash looks:

``` ruby
getClicky.visitors(:date => "last-7-days", :daily => 1)
getClicky.item(:date => "last-7-days", :item => "google.com")
getClicky.visitors_list(:domain => "google.com")
```
	
By default getclicky API returns XML as data, but you can change adding :output in parameter like:

##### JSON

``` ruby
getClicky.visitors(:output => :json, :date => "last-7-days", :daily => 1)
```
	
##### CSV

``` ruby
  getClicky.visitors(:output => :csv, :date => "last-7-days", :daily => 1)
```
	
##### PHP

``` ruby
  getClicky.visitors(:output => :php, :date => "last-7-days", :daily => 1)
```
	
This library does't support multiple types yet.

## Roadmap

* Multiple types for request
* Improve the tests
	
## Maintainer

* Peterson Ferreira (petersonferreiras@gmail.com)