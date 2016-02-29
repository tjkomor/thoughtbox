class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
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
