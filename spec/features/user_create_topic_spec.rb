require 'spec_helper'

feature 'Creating a topic' do
  scenario 'as a user' do
    create :category, name: 'Ruby on Rails'
    create_and_sign_in_user
    create_new_topic_named 'Integration Testing'
    view_topic_in_topic_list 'Integration Testing'
  end
end

def create_new_topic_named(topic_name)
  click_link 'Ruby on Rails'
  click_link 'New Topic'
  fill_in 'Name', with: topic_name
  fill_in 'Content', with: 'Integration Testing is great... blah blah blah'
  click_button 'Create Topic'
end

def view_topic_in_topic_list(topic_name)
  page.should have_content topic_name
end
