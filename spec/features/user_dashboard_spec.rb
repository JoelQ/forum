require 'spec_helper'

feature 'edit profile' do
  scenario 'change username' do
    create_and_sign_in_user
    visit "/users/#{@user.id}/edit"
    fill_in 'Username', with: 'New Username'
    click_button 'Save'
    page.should have_content 'New Username'
  end
end
