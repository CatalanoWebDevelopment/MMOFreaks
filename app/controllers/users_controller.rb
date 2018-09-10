class UsersController < ApplicationController
    
    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{user.slug}"
        else
            flash[:error] = "Error, please enter a valid username and password."
            redirect to '/'
        end
    end
    
    post '/signup' do 
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            flash[:error] = "Error, please fill out all viable fields in order to create an account."
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
            flash[:error] = "Error, you must be signed in to view this information."
            redirect '/'
        end
    end
    
    get '/logout' do
        flash[:success] = "You have successfully been logged out!"
        session.clear
        redirect '/'
    end
        
        
end