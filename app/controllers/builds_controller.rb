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
            if params[:race] == "" || params[:klass] == "" || params[:name] == ""
                redirect '/builds/new'
            else
                @build = current_user.builds.build()
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