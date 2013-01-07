require 'spec_helper'

feature 'edit profile' do
  scenario 'change username' do
    create_and_sign_in_user
    click_link 'Profile'
    click_link 'Edit Profile'
    fill_in 'Username', with: 'New Username'
    click_button 'Save'
    page.should have_content 'New Username'
  end
end
