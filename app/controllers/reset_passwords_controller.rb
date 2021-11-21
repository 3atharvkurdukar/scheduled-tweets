class ResetPasswordsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      # Send Email
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, flash: { info: "A link to reset password has been sent to your email, if the account exists" }
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
