class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Post.find(params[:post_id]).comments.create(params[:comment])
    redirect_to post_path(@post)
  end


end
