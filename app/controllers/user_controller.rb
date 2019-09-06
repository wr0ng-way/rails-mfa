class UserController < ApplicationController
  def enable_disable_mfa
    current_user.toggle!(:otp_required_for_login)
    current_user.update_otp_secret if current_user.otp_required_for_login
  end
end
