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
            if params[:karacter] == "" || params[:klass] == "" || params[:build] == ""
                redirect '/builds/new'
            else
                
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
                    redirect "/builds/new"
                end
            end
        else
            redirect '/'
        end
    end
    
    get '/builds/:id' do
        if logged_in?
            @build = Build.find_by_id(params[:id])
            @user = current_user
            erb :'/builds/show'
        else
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
        
        erb :'/builds/edit_build'
    end
        
    
    patch '/builds/:id/' do
        @build = Build.find_by_id(params[:id])
        @build.update
        @build.save
        
        redirect "/builds/#{@build.id}"
    end
        
end