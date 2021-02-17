require 'sinatra'

class Birthday < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    erb :index
  end

  post '/birthday' do
    session[:name] = params[:name]
    redirect '/birthday'
  end

  get '/birthday' do
    @name = session[:name]
    erb :birthday
  end
end
