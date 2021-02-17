ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = Birthday
