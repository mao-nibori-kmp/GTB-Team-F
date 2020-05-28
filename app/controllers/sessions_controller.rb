class SessionsController < ApplicationController
protect_from_forgery
skip_before_action :verify_authenticity_token
  def new
  end

  def create
    user = User.find_by(mail: params[:session][:mail].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      #render "users/index"
      redirect_to users_path
    else
      #flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to users_path
  end
end
