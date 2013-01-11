require 'spec_helper'

feature 'Deleting a topic' do
  scenario 'as an admin' do
    category = create :category, name: 'Ruby on Rails'
    topic = create :topic, name: 'Integration Testing', category: category
    create_and_sign_in_user_with_roles('admin')
    navigate_to_topic_list
    delete_topic topic.id
    topic_is_not_displayed 'Integration Testing'
  end
end

def delete_topic(topic_id)
  click_link "delete-#{topic_id}"
end

def navigate_to_topic_list
  click_link 'Ruby on Rails'
end

def topic_is_not_displayed(topic_name)
  page.should_not have_content topic_name
end
