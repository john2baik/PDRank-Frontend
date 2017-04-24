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
    get_output

    # dir = File.dirname(@@input_path)
    # unless File.directory?(dir)
    #   FileUtils.mkdir_p(dir)
    # end
    # @query = params[:search].to_s
    # f = File.open(@@input_path, 'w+')
    # f.write(@query)
    # f.flush
    # f.close
    #
    # fir = File.dirname(@@input_toggle)
    # unless File.directory?(fir)
    #   FileUtils.mkdir_p(fir)
    # end
    # f = File.open(@@input_toggle, 'w')
    #
    # f.close
    #
    # flash[:success] = 'Search is processing in background...'
    #
    # FileWatcher.new('/Users/johnbaik/desktop/savedSearches').watch do |filename, event|
    #   flash[:success] = "File #{event}: #{filename}"
    # end
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
  end

  def get_output
    @output_path = '/Users/ezhou7/PycharmProjects/cs370/resources/prog_output.txt'
    @output_toggle = '/Users/ezhou7/PycharmProjects/cs370/resources/output.txt'

    if FileTest.exist?(@output_toggle)
      paths = []
      IO.foreach(@output_path) { |line| paths.append line}

      paths.each_with_index { |path, i|
        render :js => "creat_slide(%s, %d, %d);" % [path, i, paths.length]
      }
    end
  end

  #        render :js => 'creat_slide(%s, %d, %d);' % [path, i, paths.length], :file => 'search.js.erb'


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :gravatar, :bio, :institution, :age, :sex, :profession, :search)
    end
end
