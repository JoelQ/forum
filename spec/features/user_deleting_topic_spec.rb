require 'spec_helper'

feature 'Deleting a topic' do
  scenario 'as a user' do
    category = create :category, name: 'Ruby on Rails'
    topic = create :topic, name: 'Integration Testing', category: category
    create_and_sign_in_user_with_roles('user')
    navigate_to_topic_list
    delete_ui_is_not_displayed_for topic.id
  end
end

def navigate_to_topic_list
  click_link 'Ruby on Rails'
end

def delete_ui_is_not_displayed_for(topid_id)
  page.should_not have_css("a#delete-#{topid_id}")
end
