class SessionsController < ApplicationController

  def new
    redirect_to tests_path if logged_in?
  end

  def create
    user = User.find_by_email(params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      flash[:notice] = 'Successfully logged in!'
      redirect_to session[:referer] || root_path
    else
      flash.now[:alert] = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:referer)
    redirect_to login_path, notice: 'Successfully logged out. Bye-bye.'
  end

end
