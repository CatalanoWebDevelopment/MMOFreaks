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
end