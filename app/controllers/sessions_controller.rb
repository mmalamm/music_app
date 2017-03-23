class SessionsController < ApplicationController

  def create
    # finding user in db
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    # if user not found, rendering login page
    # if user found, going to user#show page
    if @user.nil?
      flash.now[:errors] = "Invalid creds"
      render :new
    else
      login_user!(@user)
      redirect_to user_url(@user)
    end
  end

  def new
    # login page
    if current_user.nil?
      render :new
    else
      redirect_to user_url(current_user)
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end
end
