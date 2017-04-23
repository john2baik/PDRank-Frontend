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
    require 'filewatcher'

    givenpath = "/Users/ezhou7/PycharmProjects/cs370/resources/user_input.txt"
    togglepath = "/Users/ezhou7/PycharmProjects/cs370/resources/input.txt"

    dir = File.dirname(givenpath)
    unless File.directory?(dir)
      FileUtils.mkdir_p(dir)
    end
    @query = params[:search].to_s
    f = File.open(givenpath, "w+")
    f.write(@query)
    f.flush
    f.close

    fir = File.dirname(togglepath)
    unless File.directory?(fir)
      FileUtils.mkdir_p(fir)
    end
    f = File.open(togglepath, "w")

    f.close

    flash[:success] = "Search is processing in background..."

    FileWatcher.new('/Users/johnbaik/desktop/savedSearches').watch do |filename, event|
      flash[:success] = "File #{event}: #{filename}"
    end


    end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :bio, :institution, :age, :sex, :profession, :search)
    end


end
