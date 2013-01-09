require 'spec_helper'

feature 'post on a topic' do
  scenario 'user' do
    set_up_topic
    create_and_sign_in_user
    navigate_to_topic @category.name, @topic.name
    click_link 'Post Reply'
    fill_in 'Content', with: 'Totally love it!!!'
    click_button 'Create Post'
    page.should have_content 'Totally love it!!!'
  end
end

feature 'view responses to a topic' do
  scenario 'user' do
    set_up_topic
    @post1 = create :post, content: 'I totally agree. Good job!', topic: @topic
    @post2 = create :post, content: 'Spot on. I will definitely be implementing this on my next project!', topic: @topic
    create_and_sign_in_user
    navigate_to_topic @category.name, @topic.name
    page.should have_content @topic.content
    page.should have_content @post1.content
    page.should have_content @post2.content
    page.should have_content @topic.user.username_or_email
    page.should have_content @post1.user.username_or_email
    page.should have_content @post2.user.username_or_email
  end
end

feature 'edit a post' do
  scenario 'user' do
    set_up_topic
    @post = create :post, content: 'I totally agree. Good job!', topic: @topic
    create_and_sign_in_user
    navigate_to_topic @category.name, @topic.name
    click_link 'Edit'
    fill_in 'Content', with: 'I mostly agree. Good job.'
    click_button 'Update Post'
    page.should have_content 'I mostly agree. Good job.'
  end
end

feature 'delete post' do
  scenario 'user' do
    set_up_topic
    @post = create :post, content: 'I totally agree. Good job!', topic: @topic
    create_and_sign_in_user
    navigate_to_topic @category.name, @topic.name
    click_link 'Delete'
    page.should_not have_content @post.content
  end
end

def set_up_topic
  @category = create :category, name: 'Ruby on Rails'
  @topic = create :topic, name: 'Integration Testing', category: @category
end

def navigate_to_topic(category_name, topic_name)
  click_link category_name
  click_link topic_name
end

def set_up_and_navigate_to_topic
  @category = create :category, name: 'Ruby on Rails'
  @topic = create :topic, name: 'Integration Testing', category: @category
  yield if block_given?
  create_and_sign_in_user
  click_link 'Ruby on Rails'
  click_link 'Integration Testing'
end
