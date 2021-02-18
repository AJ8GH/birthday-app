ENV['RACK_ENV'] = 'test'

require_relative '../app'
require_relative 'feature/web_helpers'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = BirthdayApp
