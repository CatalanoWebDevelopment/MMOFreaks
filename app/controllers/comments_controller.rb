require 'pry'
class CommentsController < ApplicationController
    
    post '/builds/:id/comments/new' do
        @build = Build.find_by_id(params[:id])
        @comment = Comment.create(params[:comments])
        @comment.user_id = current_user.id    
        @comment.build_id = @build.id
        
        if @comment.save    
            redirect :"/builds/#{@build.id}"
        else
            flash[:error] = "Error, please fill out the content of your post in order to publish it."
            redirect :"/builds/#{@build.id}"
        end
    end
    
    get '/builds/:number/comments/:id/edit' do
        @build = Build.find_by_id(params[:number])
        @comment = Comment.find_by_id(params[:id])
        
        erb :'/comments/edit_comment'
    end
    
    delete '/builds/:number/comments/:id/delete' do
        @build = Build.find_by_id(params[:number])
        @comment = Comment.find_by_id(params[:id]) 
        @comment.delete
        
        redirect "/builds/#{@build.id}"
    end
end