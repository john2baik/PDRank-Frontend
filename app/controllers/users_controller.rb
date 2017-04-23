class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You are now signed in!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.save
      flash[:success] = "Saved new changes!"
      redirect_to @user
    end
  end

# handle a successful update.
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def search
    require 'fileutils'
    givenpath = "/Users/johnbaik/desktop/savedSearches/search.txt"
    dir = File.dirname(givenpath)
    unless File.directory?(dir)
      FileUtils.mkdir_p(dir)
    end
    @query = params[:search].to_s
    File.open(givenpath, "w+") do |f|
      f.write(@query)
    end
    flash[:success] = "Search is processing in background..."
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :gravatar, :bio, :institution, :age, :sex, :profession, :search)
    end


end
