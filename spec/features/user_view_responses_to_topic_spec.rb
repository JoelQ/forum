require 'spec_helper'

feature 'View responses to a topic' do
  background do
    set_up_topic
    @post1 = create :post, content: 'I totally agree. Good job!', topic: @topic
    @post2 = create :post, content: 'Spot on. I will definitely be implementing this on my next project!', topic: @topic
  end

  scenario 'as a user' do
    create_and_sign_in_user_with_roles('user')
    navigate_to_topic @category.name, @topic.name
    content_and_authors_are_displayed
  end
end

def content_and_authors_are_displayed
  page.should have_content @topic.content
  page.should have_content @post1.content
  page.should have_content @post2.content
  page.should have_content @topic.user.username
  page.should have_content @post1.user.username
  page.should have_content @post2.user.username
end
