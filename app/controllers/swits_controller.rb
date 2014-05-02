class SwitsController < ApplicationController
  before_action :set_swit, only: [:show, :edit, :update, :destroy]

  # GET /swits
  # GET /swits.json
  def index
    @swits = Swit.all
    @user = User.find_by_id(session[:id])
  end

  # GET /swits/1
  # GET /swits/1.json
  def show
    @user = User.find_by_id(session[:id])
    @comments = Comment.all
    @comment = Comment.new
  end

  # GET /swits/new
  def new
    @swit = Swit.new
  end

  # GET /swits/1/edit
  def edit
    @user = User.find_by_id(session[:id])
  end

  # POST /swits
  # POST /swits.json
  def create
    @swit = Swit.new(swit_params)

    tags = ""
    door_tags = swit_params[:content].scan(/\{.+?\}/)

    door_tags.each do |x|
      tags = tags + x
    end

    @swit.add_data(session[:id], 0, 0, tags)
    respond_to do |format|
      if @swit.save
        format.html { redirect_to home_path }
        format.json { render action: 'show', status: :created, location: @swit }
      else
        format.html { render action: 'new' }
        format.json { render json: @swit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swits/1
  # PATCH/PUT /swits/1.json
  def update
    respond_to do |format|
      if @swit.update(swit_params)
        format.html { redirect_to @swit, notice: 'Swit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @swit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swits/1
  # DELETE /swits/1.json
  def destroy
    Comment.destroy_all(:swit_id => @swit.id)
    @swit.destroy
    respond_to do |format|
      format.html { redirect_to home_path }
      format.json { head :no_content }
    end
  end

  def add_sweet
    swit = Swit.find(params[:swit_id])
    swit.update(sweet: swit.sweet + 1)
    redirect_to home_path
  end

  def add_sour
    swit = Swit.find(params[:swit_id])
    swit.update(sour: swit.sour + 1)
    redirect_to home_path
  end

  def show_swit_tags
    @comments = Comment.all
    @comment = Comment.new
    @user = User.find_by_id(session[:id])
    @tag = params[:tag_value]

    @swits = Array.new
    @swits_array = Swit.all

    @swits_array.each do |swit|
      if swit.tag.include?(@tag)
        @swits.push(swit)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swit
      @swit = Swit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swit_params
      params.require(:swit).permit(:user_id, :content, :sweet, :sour, :tag)
    end
end
