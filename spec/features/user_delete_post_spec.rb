require 'spec_helper'

feature 'Delete a post' do
  scenario 'as a user' do
    set_up_topic
    @post = create :post, content: 'I totally agree. Good job!', topic: @topic
    create_and_sign_in_user
    delete_post
    post_is_not_displayed
  end
end

def delete_post
  navigate_to_topic @category.name, @topic.name
  click_link 'Delete'
end

def post_is_not_displayed
  page.should_not have_content @post.content
end

