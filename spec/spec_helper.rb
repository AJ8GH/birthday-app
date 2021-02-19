require 'coveralls'
Coveralls.wear!

require_relative '../app'
require_relative 'feature/web_helpers'
require          'capybara'
require          'capybara/rspec'
require          'rspec'
require          'timecop'

ENV['RACK_ENV'] = 'test'
Capybara.app    = BirthdayApp
