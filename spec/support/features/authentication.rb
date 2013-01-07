module Features
  def create_and_sign_in_user
    @user = create :user, email: 'test@example.com', password: 'password'
    visit '/sign_in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
  end
end
