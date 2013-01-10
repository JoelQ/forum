require 'spec_helper'

feature 'Post on a topic' do
  scenario 'as a user' do
    set_up_topic
    create_and_sign_in_user
    navigate_to_topic @category.name, @topic.name
    click_link 'Post Reply'
    fill_in 'Content', with: 'Totally love it!!!'
    click_button 'Create Post'
    page.should have_content 'Totally love it!!!'
  end
end
