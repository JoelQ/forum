require 'spec_helper'

feature 'Delete a post' do
  scenario 'as a user' do
    set_up_topic
    @post = create :post, content: 'I totally agree. Good job!', topic: @topic
    create_and_sign_in_user
    navigate_to_topic @category.name, @topic.name
    click_link 'Delete'
    page.should_not have_content @post.content
  end
end

