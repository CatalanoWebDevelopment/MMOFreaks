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
        @comment = Comment.find_by_id(params[:id])
        @build = Build.find_by_id(params[:number])
        if current_user.id == @comment.user_id
            erb :'/comments/edit_comment'
        else
            redirect :"/builds/#{@build.id}"
        end
    end
    
    patch '/builds/:number/comments/:id' do
        @build = Build.find_by_id(params[:number])
        @comment = Comment.find_by_id(params[:id])
        
        if current_user.id == @comment.user_id
            @comment.update(params[:comment])
        else
            redirect "/builds/#{@build.id}/comments/#{@comment.id}/edit"
        end
        
        if @comment.save
            redirect "/builds/#{@build.id}"
        else
            flash[:error] = "Please add content to your new comment!"
            redirect "/builds/#{@build.id}/comments/#{@comment.id}/edit"
        end
    end
            
    delete '/builds/:number/comments/:id/delete' do
        @build = Build.find_by_id(params[:number])
        @comment = Comment.find_by_id(params[:id]) 
        @comment.delete
        
        redirect "/builds/#{@build.id}"
    end
end