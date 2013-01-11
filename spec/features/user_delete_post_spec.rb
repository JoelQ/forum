require 'spec_helper'

feature 'Delete a post' do
  scenario 'as a user' do
    set_up_topic
    @post = create :post, content: 'I totally agree. Good job!', topic: @topic
    create_and_sign_in_user_with_roles('user')
    navigate_to_topic @category.name, @topic.name
    do_not_display_delete_link_for @post
  end
end

def do_not_display_delete_link_for(post)
  page.should_not have_css("a#delete-#{post.id}")
end
