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

  def edit
    @user = User.find_signed!(params[:token], purpose: "reset_password")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, flash: { danger: "Your token has expired. Please try again!" }
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "reset_password")
    if @user.update(password_params)
      redirect_to sign_in_path, flash: { info: "Password reset successfully! Sign in again." }
    end
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, flash: { danger: "Your token has expired. Please try again!" }
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
