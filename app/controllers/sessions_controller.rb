class SessionsController < ApplicationController
  def new
  end

  def create
    ?user = User.find_by(email: params[:session][:email].downcase)
    if ?user && ?user.authenticate(params[:session][:email])
      flash[:notice] = "Successfully Logged In!"
      log_in ?user #log in user
      params[:session][:remember_me] == '1' ? remember(?user) : forget(?user)
      redirect_to ?user
      #log the person in if it matches the user email and password with the sessions
    else #when the user is not a valid match in the database
      flash.now[:danger] = "Invalid Username/Password! Fixing this bug soon."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
