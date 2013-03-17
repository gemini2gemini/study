class FunCommentsController < ApplicationController
  # GET /fun_comments
  # GET /fun_comments.json
  def index
    @fun_comments = FunComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fun_comments }
    end
  end

  # GET /fun_comments/1
  # GET /fun_comments/1.json
  def show
    @fun_comment = FunComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fun_comment }
    end
  end

  # GET /fun_comments/new
  # GET /fun_comments/new.json
  def new
    @fun_comment = FunComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fun_comment }
    end
  end

  # GET /fun_comments/1/edit
  def edit
    @fun_comment = FunComment.find(params[:id])
  end

  # POST /fun_comments
  # POST /fun_comments.json
  def create
    @fun_comment = FunComment.new(params[:fun_comment])

    respond_to do |format|
      if @fun_comment.save
        format.html { redirect_to @fun_comment, notice: 'Fun comment was successfully created.' }
        format.json { render json: @fun_comment, status: :created, location: @fun_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @fun_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fun_comments/1
  # PUT /fun_comments/1.json
  def update
    @fun_comment = FunComment.find(params[:id])

    respond_to do |format|
      if @fun_comment.update_attributes(params[:fun_comment])
        format.html { redirect_to @fun_comment, notice: 'Fun comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fun_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fun_comments/1
  # DELETE /fun_comments/1.json
  def destroy
    @fun_comment = FunComment.find(params[:id])
    @fun_comment.destroy

    respond_to do |format|
      format.html { redirect_to fun_comments_url }
      format.json { head :no_content }
    end
  end
end
