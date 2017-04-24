require 'fileutils'
require 'filewatcher'


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
    @query = params[:search].to_s
    send_input @query
    redirect_to pdfviewer_path

    # respond_to do |format|
    #   format.js
    #   format.html
    # end

    # get_output
  end

  def send_input(search_input)
    @input_path = '/Users/ezhou7/PycharmProjects/cs370/resources/user_input.txt'
    @input_toggle = '/Users/ezhou7/PycharmProjects/cs370/resources/input.txt'

    fout = File.open(@input_path, 'w+')

    fout.write(search_input)

    fout.flush
    fout.close

    ftg = File.open(@input_toggle, 'w')
    ftg.close
    # redirect_to User.find(params[:user_id])
  end

  def get_output
    @output_path = '/Users/ezhou7/PycharmProjects/cs370/resources/prog_output.json'
    @output_toggle = '/Users/ezhou7/PycharmProjects/cs370/resources/output.txt'

    if FileTest.exist?(@output_toggle)
      paths = []
      IO.foreach(@output_path) { |line| paths.append line}

      @user = User.find(params[:id])


      paths.each_with_index { |path, i|
        # render :js => "creat_slide(%s, %d, %d);" % [path, i, paths.length], :remote => true
        render :partial => 'users/show.html.erb'
      }
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :bio, :institution, :age, :sex, :profession, :search, :paths)
    end
end
