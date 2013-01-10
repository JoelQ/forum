require 'spec_helper'

feature 'Edit a post' do
  scenario 'as auser' do
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
