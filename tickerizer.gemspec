# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tickerizer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["jimmayes"]
  gem.email         = ["jim.mayes@gmail.com"]
  gem.description   = %q{Parses content and extras stock tickers for companies mentioned}
  gem.summary       = %q{Parse content for stock tickers}
  gem.homepage      = ""

  gem.add_dependency "calais"
  gem.add_dependency "json"

  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tickerizer"
  gem.require_paths = ["lib"]
  gem.version       = Tickerizer::VERSION
end
