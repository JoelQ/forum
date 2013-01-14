require 'spec_helper'

feature 'Edit a post' do
  scenario 'own post as a user' do
    set_up_topic
    user = create_and_sign_in_user_with_roles('user')
    @post = create :post, content: 'I totally agree. Good job!', topic: @topic, user: user
    navigate_to_topic @category.name, @topic.name
    change_post_content_to 'I no longer agree. OK job'
    page_displays_updated_post_content 'I no longer agree. OK job'
  end

  scenario 'other user\'s post as a user' do
    set_up_topic
    user = create_and_sign_in_user_with_roles('user')
    @post = create :post, content: 'I totally agree. Good job!', topic: @topic
    navigate_to_topic @category.name, @topic.name
    edit_link_is_not_shown_for @post
  end
end

def edit_link_is_not_shown_for(post)
  page.should_not have_css("a#edit-#{post.id}")
end

def change_post_content_to(content)
  click_link 'Edit'
  fill_in 'Content', with: content
  click_button 'Update Post'
end

def page_displays_updated_post_content(content)
  page.should have_content content
end
