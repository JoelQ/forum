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
    create_and_sign_in_user_with_roles('user')
    navigate_to_other_user_post_in category
    cannot_see_edit_link_for_post
  end
end

def navigate_to_other_user_post_in(category)
  @topic = create :topic, name: 'Integration Testing', category: category
  click_link category.name
end

def change_topic_to(name)
  click_link 'Ruby on Rails'
  click_link 'Update Topic'
  fill_in 'Name', with: name
  click_button 'Update Topic'
end

def new_topic_name_is_displayed(name)
  page.should have_content name
end

def cannot_see_edit_link_for_post
  page.should_not have_css("a#edit-#{@topic.id}")
end
