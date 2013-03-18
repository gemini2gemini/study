# coding: utf-8

class HelloController < ApplicationController
  def index
  	render :text => "こんにちは、世界"
  end

  def view
  	@msg = "こんにちは、世界！"
  end

  def list
  	@books = Book.all
  end

  def app_var
  	render :text => Railbook::Application.config.author
  end

  def keyword
  end

  def form_tag
    @book = Book.new
  end

end
