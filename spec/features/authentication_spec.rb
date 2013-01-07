require 'spec_helper'

feature 'Sign up' do
  scenario 'new user' do
    visit '/users/new'
    fill_in 'Email', with: 'me@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'
    page.should have_content 'Home'
  end

  scenario 'current user' do
    create_and_sign_in_user
    visit '/sign_up'
    current_path.should == '/'
    page.should have_content 'Home'
  end
end

feature 'Sign in' do
  scenario 'existing user' do
    create_and_sign_in_user
    current_path.should == '/'
  end

  scenario 'new user' do
    visit '/sign_in'
    fill_in 'Email', with: 'new_user@example.com'
    fill_in 'Password', with: 'new_password'
    click_button 'Sign in'
    page.should have_content 'Sign in'
    page.should have_content 'Bad email or password'
  end
end

feature 'Sign out' do
  scenario 'signed_in user' do
    create_and_sign_in_user
    click_link 'Log out'
    current_path.should == sign_in_path
  end
end

def create_and_sign_in_user
  FactoryGirl.create :user, email: 'test@example.com', password: 'password'
  visit '/sign_in'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'password'
  click_button 'Sign in'
end
