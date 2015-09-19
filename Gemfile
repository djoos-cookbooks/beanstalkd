source 'https://rubygems.org'

gem 'rake'

group :lint do
  gem 'rubocop'
  gem 'foodcritic', '~> 5.0'
end

group :unit, :integration do
  gem 'berkshelf',  '~> 3.3'
end

group :unit do
  gem 'chefspec', '~> 4.3'
end

group :integration do
  gem 'test-kitchen'
  gem 'kitchen-vagrant', '~> 0.11'
end
