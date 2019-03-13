class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login_user
      redirect_to user
    else
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
      #redirect_to login_path
    end
  end

  def destroy
  end

end
