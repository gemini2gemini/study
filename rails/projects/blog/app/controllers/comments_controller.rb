class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Post.find(params[:post_id]).comments.create(params[:comment])
    
    if @comment.save
      redirect_to post_path(@post)
    else
      render :template => "posts/show"
    end
  end


end
