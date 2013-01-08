require 'spec_helper'

feature 'Post on a topic' do
  scenario 'as a user' do
    set_up_topic
    create_and_sign_in_user
    navigate_to_topic @category.name, @topic.name
    post_reply 'Totally love it!!!'
    reply_is_displayed 'Totally love it!!!'
  end
end

def post_reply(content)
  click_link 'Post Reply'
  fill_in 'Content', with: content
  click_button 'Create Post'
end

def reply_is_displayed(content)
  page.should have_content 'Totally love it!!!'
end
