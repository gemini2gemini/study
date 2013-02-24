class PostsController < ApplicationController

  def index
    #インスタンス変数 @postsに、Postのデータを全部入れる
    @posts = Post.all
  end



end
