class UsersController < ApplicationController

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      redirect_to @user
    else
      flash.now[:error] = 'An error occured while saving your changes'
      render :edit
    end
  end
end
