require 'spec_helper'

feature 'Editing a category' do
  scenario 'as a user' do
    create :category, name: 'Ruby on Rails'
    create_and_sign_in_user
    click_link 'Edit'
    fill_in 'Name', with: 'Rails Issues'
    click_button 'Update Category'
    page.should have_content 'Rails Issues'
  end
end
