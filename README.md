# Tickerizer

Use Tickerizer to extract company names and stock symbols from content strings.

[![Build Status](https://travis-ci.org/JimMayes/tickerizer.png?branch=master)](https://travis-ci.org/JimMayes/tickerizer) 
[![Code Climate](https://codeclimate.com/github/JimMayes/tickerizer.png)](https://codeclimate.com/github/JimMayes/tickerizer)

## Requirements

An OpenCalais account is required to make use of this gem. Create your account and request an API key at http://www.opencalais.com/APIkey

## Installation

Add this line to your application's Gemfile:
```
gem 'tickerizer'
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install tickerizer
```

## Configuration
Provide your OenCalais API Key in familiar config block fashion
```ruby
Tickerizer.configure do |config|
	config.license_id = 'YOUR_API_KEY_HERE'
end
```

## Usage

### Extracting Company Information

Provide a string of content to Tickerizer's extract method and it will return an array containing the company references found.

```ruby
content = "Ford CEO Alan Mulally is reportedly among the names being discussed by Microsoft's board of directors as a successor to Steve Ballmer, who'll be retiring within a year. Would such a move make sense for Microsoft?"

companies = Tickerizer.extract(content)

#=> [{:name=>"Microsoft", :relevance=>0.667, :ticker=>"MSFT", :symbol=>"MSFT.OQ"}, {:name=>"Ford", :relevance=>0.476, :ticker=>"F", :symbol=>"F.N"}]
```

Results are ordered by their semantic relevance to the content string. Therefore, it is non-trivial to retrieve a "primary ticker" (most relevant) for the provided content string

```ruby
companies.first[:ticker]
#=> "MSFT"
```