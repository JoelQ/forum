require 'spec_helper'

feature 'Sign up' do
  scenario 'new user' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'me@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'
    page.should have_content 'Home'
  end

  scenario 'current user' do
    create_and_sign_in_user_with_roles('user')
    visit '/sign_up'
    current_path.should == '/'
    page.should have_content 'Home'
  end
end

feature 'Sign in' do
  scenario 'existing user' do
    create_and_sign_in_user_with_roles('user')
    current_path.should == '/'
  end

  scenario 'new user' do
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'new_user@example.com'
    fill_in 'Password', with: 'new_password'
    click_button 'Sign in'
    page.should have_content 'Sign in'
    page.should have_content 'Bad email or password'
  end
end

feature 'Sign out' do
  scenario 'signed_in user' do
    create_and_sign_in_user_with_roles('user')
    click_link 'Log out'
    current_path.should == sign_in_path
  end
end

feature 'Greeting' do
  scenario 'signed in user' do
    create_and_sign_in_user_with_roles('user')
    page.should have_content "Hello #{@user.username}"
  end

  scenario 'guest user' do
    visit '/'
    page.should have_content 'Hello Anonymous'
  end
end
