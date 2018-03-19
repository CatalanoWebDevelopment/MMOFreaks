require 'pry'
class BuildsController < ApplicationController
    
    get "/builds/new" do
        if logged_in?
            erb :'/builds/create_build'
        else
            redirect '/'
        end
    end
    
    post '/builds' do        
        if logged_in?
                @build = Build.create(params[:build])
                
                new_char = Karacter.create(params[:karacter])
                @build.karacter = new_char
                
                new_klass = Klass.create(params[:klass])
                @build.klass = new_klass
                
                new_gear = Gear.create(head: params[:gear][:head], chest: params[:gear][:chest], arms: params[:gear][:arms], feet: params[:gear][:feet])
                @build.gears.push(new_gear)
                
                @build.save
                
                if @build.save
                    
                    redirect "/builds/#{@build.id}"
                else
                    flash[:error] = "Error, please fill out all fields in order to create build."
                    redirect "/builds/new"
                end
        else
            flash[:error] = "Error, you must be signed in to create a build."
            redirect '/'
        end
    end
    
    get '/builds/:id' do
        if logged_in?
            @build = Build.find_by_id(params[:id])
            @comments = Comment.all
            @user = current_user
            erb :'/builds/show'
        else
            flash[:error] = "Error, you must be signed in to view this information."
            redirect '/'
        end
    end
    
    delete '/builds/:id/delete' do
        @user = current_user
        @build = Build.find_by_id(params[:id])
        @build.delete
        
        redirect "/users/#{@user.slug}"
    end
    
    get '/builds/:id/edit' do
        @build = Build.find_by_id(params[:id])
        if current_user.id == @build.user_id
            erb :'/builds/edit_build'
        else
            redirect :"/builds/#{@build.id}"
        end
    end
        
    
    patch '/builds/:id' do
        @build = Build.find_by_id(params[:id])
        @build.update(params[:build])
        @build.save
        
        if @build.save 
            flash[:success] = "Success! Your build has been created."
            redirect "/builds/#{@build.id}"
        else
            flash[:error] = "Error, a field has been left blank."
            redirect "/builds/#{@build.id}/edit"
        end
    end
        
end