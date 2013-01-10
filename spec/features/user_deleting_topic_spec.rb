require 'spec_helper'

feature 'Deleting a topic' do
  scenario 'as a user' do
    category = create :category, name: 'Ruby on Rails'
    create :topic, name: 'Integration Testing', category: category
    create_and_sign_in_user
    click_link 'Ruby on Rails'
    click_link 'Delete'
    page.should_not have_content 'Integration Testing'
  end
end
