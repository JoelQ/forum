require 'spec_helper'

feature 'Edit a post' do
  scenario 'as auser' do
    set_up_topic
    @post = create :post, content: 'I totally agree. Good job!', topic: @topic
    create_and_sign_in_user_with_roles('user')
    change_post_content_to 'I no longer agree. OK job'
    page_displays_updated_post_content 'I no longer agree. OK job'
  end
end

def change_post_content_to(content)
  navigate_to_topic @category.name, @topic.name
  click_link 'Edit'
  fill_in 'Content', with: content
  click_button 'Update Post'
end

def page_displays_updated_post_content(content)
  page.should have_content content
end
