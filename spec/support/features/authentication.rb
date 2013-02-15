module Features
  def create_and_sign_in_user_with_roles(*roles)
    @user = create :user, email: 'test@example.com', password: 'password', roles: roles
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    @user
  end
end
