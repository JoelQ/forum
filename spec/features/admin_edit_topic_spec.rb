require 'spec_helper'

feature 'Updating a topic' do
  scenario 'as an admin' do
    category = create :category, name: 'Ruby on Rails'
    create :topic, name: 'Integration Testing', category: category
    create_and_sign_in_user_with_roles('admin')
    change_topic_to 'Unit Testing'
    new_topic_name_is_displayed 'Unit Testing'
  end
end

def change_topic_to(name)
  click_link 'Ruby on Rails'
  click_link 'Edit'
  fill_in 'Name', with: name
  click_button 'Update Topic'
end

def new_topic_name_is_displayed(name)
  page.should have_content name
end
