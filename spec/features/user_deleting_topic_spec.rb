require 'spec_helper'

feature 'Deleting a topic' do
  scenario 'as a user' do
    category = create :category, name: 'Ruby on Rails'
    create :topic, name: 'Integration Testing', category: category
    create_and_sign_in_user
    delete_topic
    topic_is_not_displayed 'Integration Testing'
  end
end

def delete_topic
  click_link 'Ruby on Rails'
  click_link 'Delete'
end

def topic_is_not_displayed(topic_name)
  page.should_not have_content topic_name
end
