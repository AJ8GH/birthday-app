require 'sinatra'

class Birthday < Sinatra::Base
  configure do
    enable :sessions
    set :sessions_secret, ENV['SESSIONS_SECRET']
  end

  get '/' do
    erb :index
  end
end
