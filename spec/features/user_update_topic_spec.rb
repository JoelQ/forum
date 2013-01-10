require 'spec_helper'

feature 'Updating a topic' do
  scenario 'as a user' do
    category = create :category, name: 'Ruby on Rails'
    create :topic, name: 'Integration Testing', category: category
    create_and_sign_in_user
    click_link 'Ruby on Rails'
    click_link 'Edit'
    fill_in 'Name', with: 'Unit Testing'
    click_button 'Update Topic'
    page.should have_content 'Unit Testing'
  end
end
