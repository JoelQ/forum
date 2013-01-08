require 'spec_helper'

feature 'Delete a post' do
  scenario 'as a user' do
    set_up_topic
    @post = create :post, content: 'I totally agree. Good job!', topic: @topic
    create_and_sign_in_user
    navigate_to_topic @category.name, @topic.name
    delete_post @post.id
    post_is_not_displayed
  end
end

def delete_post(post_id)
  click_link "delete-#{post_id}"
end

def post_is_not_displayed
  page.should_not have_content @post.content
end

