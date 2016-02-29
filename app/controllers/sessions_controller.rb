class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:login][:username])
    if @user && @user.authenticate(params[:login][:password])
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash.now[:errors] = "Invalid username or password."
      render :new
    end
  end

  def delete
    session.delete(:user_id)
    redirect_to root_path
  end
end
