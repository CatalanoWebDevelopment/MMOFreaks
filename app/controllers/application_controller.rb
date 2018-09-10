require './config/environment'



class ApplicationController < Sinatra::Base

  configure do
    set :public_folder , 'public'
    set :views, 'app/views'
    enable :sessions
    set :protection, :except => :frame_options
    set :database_file, "./database.yml"
    register Sinatra::Flash
    set :session_secret, ENV.fetch('SESSION_SECRET')
  end
    
  configure :production do
    set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'mmofreaks_production', pool: 5}
  end

  get '/' do 
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

  end
end