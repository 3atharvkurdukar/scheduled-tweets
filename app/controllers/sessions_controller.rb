class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, flash: { info: "Signed in successfully!" }
    else
      flash[:danger] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { info: "Logged out!" }
  end

  private

  def signin_params
  end
end
