require 'spec_helper'

feature 'Updating a topic' do
  scenario 'own topic as a user' do
    category = create :category, name: 'Ruby on Rails'
    create_and_sign_in_user_with_roles('user')
    create :topic, name: 'Integration Testing', category: category, user: @user
    change_topic_to 'Unit Testing'
    new_topic_name_is_displayed 'Unit Testing'
  end

  scenario 'other topic as a user' do
    category = create :category, name: 'Ruby on Rails'
    topic = create :topic, name: 'Integration Testing', category: category
    create_and_sign_in_user_with_roles('user')
    click_link 'Ruby on Rails'
    edit_ui_is_not_displayed_for topic.id
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

def edit_ui_is_not_displayed_for(topic_id)
  page.should_not have_css("a#edit-#{topic_id}")
end
