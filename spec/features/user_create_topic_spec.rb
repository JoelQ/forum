require 'spec_helper'

feature 'Creating a topic' do
  scenario 'as a user' do
    create :category, name: 'Ruby on Rails'
    create_and_sign_in_user
    click_link 'Ruby on Rails'
    click_link 'New Topic'
    fill_in 'Name', with: 'Integration Testing'
    fill_in 'Content', with: 'Integration Testing is great... blah blah blah'
    click_button 'Create Topic'
    page.should have_content 'Integration Testing'
  end
end
