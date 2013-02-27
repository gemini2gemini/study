# coding: utf-8

class PostsController < ApplicationController

  def index
    #インスタンス変数 @postsに、Postのデータを全部入れる
    @posts = Post.all(:order => "created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to posts_path, notice: '作成されました'
    else
      render action: 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
 
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to posts_path, notice: '更新されました！'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '削除しました！'
  end


end
