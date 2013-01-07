class UsersController < ApplicationController

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.username = params[:user][:username] == "" ? nil : params[:user][:username]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password] if params[:user][:password].present?
    if @user.save
      redirect_to @user
    else
      flash.now[:error] = 'An error occured while saving your changes'
      render :edit
    end
  end
end
