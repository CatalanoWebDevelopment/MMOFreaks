class UsersController < ApplicationController
    
    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{user.slug}"
        else
            redirect to '/'
        end
    end
    
    post '/signup' do 
        if params[:username] == "" || params[:email] == "" ||           params[:password] == ""
            redirect to '/'
        else
            @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
            @user.save
            session[:user_id] = @user.id
            redirect to "/users/#{@user.slug}"
        end
    end
    
    get '/users/:slug' do
        if logged_in?
            @user = User.find_by_slug(params[:slug])            
            @build = Build.all
            erb :'/users/show'
        else
            redirect '/'
        end
    end
    
    get '/logout' do
        session.clear
        redirect '/'
    end
        
        
end