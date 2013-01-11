class UsersController < Clearance::UsersController

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = user_from_params
    @user.roles = ['user']
    @user.username = @user.email

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render :template => 'users/new'
    end
  end

  def update
    @user = User.find params[:id]
    @user.username = valid_username_or_nil
    @user.email = params[:user][:email]
    if params[:user][:password].present?
      @user.password = params[:user][:password]
    end

    if @user.save
      redirect_to @user
    else
      flash.now[:error] = 'An error occured while saving your changes'
      render :edit
    end
  end

  private

  def valid_username_or_nil
    params[:user][:username] == "" ? nil : params[:user][:username]
  end
end
