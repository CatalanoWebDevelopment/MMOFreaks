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
                @build.build_karacter(params[:karacter])
                @build.build_klass(params[:klass])
                @build.equipments.build_equipment
                
                
                
                
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
            erb :'/builds/show'
        else
            redirect '/'
        end
    end
        
end