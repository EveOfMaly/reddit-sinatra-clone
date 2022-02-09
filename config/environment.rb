ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'rack-flash'
require 'sinatra'
require 'sinatra/flash'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)

require_all 'app'