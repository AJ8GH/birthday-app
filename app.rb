require 'sinatra'
require './lib/birthday'

class BirthdayApp < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    erb :index
  end

  post '/birthday' do
    session[:name]  = params[:name]
    session[:day]   = params[:day]
    session[:month] = params[:month]
    redirect '/birthday'
  end

  get '/birthday' do
    @name     = session[:name]
    @day      = session[:day]
    @month    = session[:month]
    @birthday = Birthday.new
    erb :birthday
  end
end
