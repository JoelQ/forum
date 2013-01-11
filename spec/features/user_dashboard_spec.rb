require 'spec_helper'

feature 'edit profile' do
  background do
    create_and_sign_in_user_with_roles('user')
    click_link 'Profile'
    click_link 'Edit Profile'
  end

  scenario 'change username' do
    fill_in 'Username', with: 'New Username'
    click_button 'Save'
    page.should have_content 'New Username'
  end

  scenario 'change email' do
    fill_in 'Email', with: 'new@email.com'
    click_button 'Save'
    page.should have_content 'new@email.com'
  end

  scenario 'change password' do
    fill_in 'Password', with: 'another_password'
    click_button 'Save'
    click_link 'Log out'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'another_password'
    click_button 'Sign in'
    page.should have_content @user.username
  end

end
