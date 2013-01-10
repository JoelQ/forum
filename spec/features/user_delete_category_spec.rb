require 'spec_helper'

feature 'Deleting a category' do
  scenario 'as a user' do
    create :category, name: 'Ruby on Rails'
    create_and_sign_in_user
    click_link 'Delete'
    page.should_not have_content 'Ruby on Rails'
  end
end
